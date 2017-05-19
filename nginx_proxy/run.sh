#!/bin/bash
set -e

ssl=$(cat /data/options.json | jq -r '.ssl // empty')
if [ "$ssl" == "true" ]; then
    tpl=vhost.tpl
else
    tpl=vhost_nossl.tpl
fi

cat /data/options.json | jq -r '.vhosts[] | .vhost+" "+.port+" "+if .default_server then "default_server" else "" end' | while read VHOST PORT DEFAULT_SERVER;do export VHOST PORT DEFAULT_SERVER;envsubst '$VHOST $PORT $DEFAULT_SERVER' < /templates/${tpl} >> /etc/nginx/conf.d/${VHOST}.conf;unset VHOST PORT DEFAULT_SERVER;done

nginx
