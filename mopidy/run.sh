#!/bin/bash
set -e

local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+"\""+.name+"="+.value+"\"" ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

if  [ "$local_scan" == "true" ]; then
    eval mopidy --config $config $options local scan
fi
eval mopidy --config $config $options
