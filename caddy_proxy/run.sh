#!/bin/bash
set -e
email=$(jq -r '.email' /data/options.json)
https_only=$(jq -r 'if .disable_http_chalenge? then "-disable-http-challenge" else "" ' /data/options.json)
mustache-cli /data/options.json /templates/vhost.mustache > /tmp/caddy.conf
mkdir -p /ssl/caddy
export CADDYPATH=/ssl/caddy
caddy -agree ${https_only} -email "$email" -conf /tmp/caddy.conf
