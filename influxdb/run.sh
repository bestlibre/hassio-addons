#!/bin/bash
set -e
jq --raw-output '.env_var | .[] | .name + " " + .value' /data/options.json | while read name val;do export $name="$val";done

influxd
