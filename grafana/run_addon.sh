#!/bin/bash
set -e

eval $(jq --raw-output '.env_var | .[] | "export " + .name + "=\"" + .value + "\""' /data/options.json)

PLUGINS=$(jq --raw-output '(.plugins // []) | .[]' /data/options.json)
if [ -n "$PLUGINS" ]
then
    for p in $PLUGINS
    do
	grafana-cli plugins install $p
    done
fi

/run.sh
