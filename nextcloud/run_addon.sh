#!/bin/bash
set -e

HTML_DIR=/data/www/html
if [ ! -d "${HTML_DIR}" ]; then
    mkdir -p "${HTML_DIR}" 
    chown -R www-data:root "${HTML_DIR}"
    chmod -R g=u "${HTML_DIR}"
fi
SHARE_DIR=/share/nextcloud
if [ ! -d "${SHARE_DIR}" ]; then
    mkdir -p "${SHARE_DIR}" 
    chown -R www-data:root "${SHARE_DIR}"
    chmod -R g=u "${SHARE_DIR}"
fi
eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

/entrypoint.sh "$@"
