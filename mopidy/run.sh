#!/bin/bash
options=$(catcat /data/options.json | jq -r '[.options[] | "-o "+.name+"="+.value ] | join(" ")')

mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf $options
