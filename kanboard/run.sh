#!/bin/bash
set -e

mkdir -p /data/data /data/plugins
chown -R nobody:nobody /data/data /data/plugins

php-fpm7
nginx
