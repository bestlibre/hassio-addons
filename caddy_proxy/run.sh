#!/bin/bash
set -e
email=$(jq -r '.email' /data/options.json)
https_only=$(jq -r 'if .disable_http_chalenge? then "-disable-http-challenge" else "" end' /data/options.json)
staging=$(jq -r 'if .staging? then "-ca https://acme-staging-v02.api.letsencrypt.org/directory" else "" end' /data/options.json)
homeassistant=$(jq -r '.homeassistant // empty' /data/options.json)

if [ -f /tmp/caddy.conf ];
then
    rm /tmp/caddy.conf
fi

if [ -n "$homeassistant" ];
then
    echo "{\"vhosts\":[{\"vhost\":\"$homeassistant\", \"port\":\"8123\"}]}" | python3 /mustache.py /templates/vhost.mustache - >> /tmp/caddy.conf
fi

python3 /mustache.py /templates/vhost.mustache /data/options.json >> /tmp/caddy.conf

mkdir -p /ssl/caddy
export CADDYPATH=/ssl/caddy
caddy -agree ${https_only} ${staging} -email "$email" -conf /tmp/caddy.conf
