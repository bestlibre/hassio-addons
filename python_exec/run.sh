#!/bin/bash
set -e

requirements=$(cat /data/options.json | jq -r 'if .requirements then [.requirements[] | join(" ") else "" end')
code=$(cat /data/options.json | jq -r '.code')
if [ -n $requirements ];
then
    pip install -U ${requirements}
fi
python ${code}


