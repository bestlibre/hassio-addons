#!/bin/bash
set -e

CERT_DIR=/ssl/letsencrypt
WORK_DIR=/data/workdir
CONFIG_PATH=/data/options.json

EMAIL=$(jq --raw-output ".email" $CONFIG_PATH)
DOMAINS=$(jq --raw-output ".domains[]" $CONFIG_PATH)
DEBUG=$(jq --raw-output ".debug // empty" $CONFIG_PATH)

mkdir -p /ssl/wk

while true; do

    for DOMAIN in $DOMAINS; do
        certbot certonly --webroot -w /ssl/wk/ --non-interactive --email "$EMAIL" --agree-tos --config-dir "$CERT_DIR" --work-dir "$WORK_DIR" -d ${DOMAIN}
        if [ "$DEBUG" == "true" ]; then
	           cat /var/log/letsencrypt/letsencrypt.log
        fi
    done
    
    sleep 1d
done

