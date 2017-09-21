#!/bin/bash
set -e
host=$(jq -r '.host // empty' /data/options.json)
if [ -n "${host}" ];
then
    host="-h ${host}"
fi
snapclient ${host} 
