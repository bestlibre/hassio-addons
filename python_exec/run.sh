#!/bin/bash
set -e

requirements=$(cat /data/options.json | jq -r 'if .requirements then .requirements | join(" ") else "" end')
code=$(cat /data/options.json | jq -r '.code')
clean=$(cat /data/options.json | jq -r '.clean //empty')

if [ -n "$requirements" ];
then
    if [ "$clean" == "true" ];
    then
	rm -rf /data/venv/
    fi
    if [ ! -f "/data/venv/bin/activate" ];
    then
       mkdir -p /data/venv/
       cd /data/venv
       virtualenv
       . bin/activate
    fi
    pip install -U ${requirements}
fi
python ${code}


