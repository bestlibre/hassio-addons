#!/bin/bash
set -e

mustache-cli /data/options.json /templates/vhost.mustache >> /etc/nginx/conf.d/vhosts.conf

nginx
