#!/bin/bash
set -e
ssl=$(jq -r '[.vhosts[] | .certname // empty] | if length > 0 then "true" else "false" end' /data/options.json)
if [ "$ssl" == "true" ]; then
    if [ ! -e /data/dhparam.pem ]; then
        openssl dhparam -dsaparam -out /data/dhparam.pem 4096
    fi
fi
mustache-cli /data/options.json /templates/vhost.mustache

nginx
