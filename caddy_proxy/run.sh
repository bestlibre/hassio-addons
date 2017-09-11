#!/bin/bash
set -e
email=$(jq -r '.email' /data/options.json)
https_only=$(jq -r 'if .disable_http_chalenge? then "-disable-http-challenge" else "" end' /data/options.json)
homeassistant=$(jq -r '.homeassistant // empty' /data/options.json)

if [ -n "$homeassistant" ];
then
    echo "{\"vhosts\":[{\"vhost\":\"$homeassistant\", \"port\":\"8123\"}]}" | mustache-cli /templates/vhost.mustache >> /tmp/caddy.conf
fi

mustache-cli /data/options.json /templates/vhost.mustache >> /tmp/caddy.conf
echo $(jq -r '.raw_config // empty' /data/options.json) >> /tmp/caddy.conf

mkdir -p /ssl/caddy
export CADDYPATH=/ssl/caddy
caddy -agree ${https_only} -email "$email" -conf /tmp/caddy.conf
