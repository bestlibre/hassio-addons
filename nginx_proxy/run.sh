#!/bin/bash
set -e
options="/data/options.json"
ssl=$(jq -r '[.vhosts[] | .certname // empty] | if length > 0 then "true" else "false" end' $options)
if [ "$ssl" == "true" ]; then
    if [ ! -e /data/dhparam.pem ]; then
        openssl dhparam -dsaparam -out /data/dhparam.pem 4096
    fi
fi

auths=$(jq -r '.vhosts[] | if .auth then .vhost + " " + .auth else empty end' $options)
echo "$auths" | while read -r vhost auth; do
    echo "$auth" >"/data/auth_$vhost"
done

mustache-cli /data/options.json /templates/vhost.mustache > /etc/nginx/conf.d/vhosts.conf

# forward request and error logs to docker log collector
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
nginx
