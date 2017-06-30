#!/bin/bash
set -e

CERT_DIR=/ssl/letsencrypt
WORK_DIR=/data/workdir
CONFIG_PATH=/data/options.json

EMAIL=$(jq --raw-output ".email" $CONFIG_PATH)
DEBUG=$(jq --raw-output ".debug // empty" $CONFIG_PATH)
SSL_ONLY=$(jq --raw-output ".ssl_only // empty" $CONFIG_PATH)

mkdir -p /ssl/wk
if [ "${SSL_ONLY}" == "true" ]; then
    PLUGIN="--standalone --preferred-challenges tls-sni"
else
    PLUGIN="--webroot -w /ssl/wk/"
fi
while true; do
    jq -r '.certificats[] | .name + " " + .domains' $CONFIG_PATH |
	while read name domains; do
            certbot certonly $PLUGIN --non-interactive --email "$EMAIL" --agree-tos --config-dir "$CERT_DIR" --work-dir "$WORK_DIR" --cert-name $name -d ${domains}
            if [ "$DEBUG" == "true" ]; then
	           cat /var/log/letsencrypt/letsencrypt.log
            fi
	done
    
    sleep 1d
done

