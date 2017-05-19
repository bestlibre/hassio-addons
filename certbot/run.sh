#!/bin/bash
set -e

CERT_DIR=/ssl/letsencrypt
WORK_DIR=/data/workdir
CONFIG_PATH=/data/options.json

EMAIL=$(jq --raw-output ".email" $CONFIG_PATH)
DOMAINS=$(jq --raw-output ".domains[]" $CONFIG_PATH)

for line in $DOMAINS; do
    if [ -z "$DOMAIN_ARG" ]; then
        DOMAIN_ARG="-d $line"
    else
        DOMAIN_ARG="$DOMAIN_ARG -d $line"
    fi
done

mkdir -p /ssl/wk

certbot certonly --webroot -w /ssl/wk/ --non-interactive --email "$EMAIL" --agree-tos --config-dir "$CERT_DIR" --work-dir "$WORK_DIR" ${DOMAIN_ARG}
