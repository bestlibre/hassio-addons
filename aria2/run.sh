#!/bin/bash
set -e
secret=$(jq -r '.secret // "123456789"' /data/options.json)
downloads=$(jq -r '.downloads // "/share/aria2/"' /data/options.json)
options=$(jq -r 'if .options then [.options[] | "--"+.name+"="+.value ] | join(" ") else "" end' /data/options.json)
session_file=/data/aria.session.gz

darkhttpd /webui-aria2 --port 8080 &

aria2c --enable-rpc --rpc-secret=${secret} --rpc-listen-all --save-session=${session_file} --input-file=${session_file} --save-session-interval=30 --dir=${downloads} ${options}
