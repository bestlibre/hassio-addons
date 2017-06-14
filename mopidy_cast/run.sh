#!/bin/bash
set -e

local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf:/var/lib/mopidy/.config/mopidy/mopidy_cast.conf"

snapserver -s pipe:///tmpfs/snapfifo?name=default &

if  [ "$local_scan" == "true" ]; then
    mopidy --config $config $options local scan
fi
mopidy --config $config $options
