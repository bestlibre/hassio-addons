#!/bin/bash
set -e

local_scan=$(cat /data/options.json | jq -r '.local_scan // empty')
options=$(cat /data/options.json | jq -r '[.options[] | "-o "+.name+"="+.value ] | join(" ")')

snapserver &

if  [ "$local_scan" == "true" ]; then
    mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf $options local scan
fi
mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf:/var/lib/mopidy/.config/mopidy/mopidy_cast.conf $options
