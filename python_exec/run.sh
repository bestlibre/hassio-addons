#!/bin/bash
set -e

requirements=$(cat /data/options.json | jq -r 'if .requirements then [.requirements[] | join(" ") else "" end')
$(cat /data/options.json | jq -r '.code') > /tmp/code.py
if [ -n $requirements ];
then
    pip install -U ${requirements}
fi
python /tmp/code.py


