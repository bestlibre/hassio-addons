#!/bin/bash
set -e
secret=$(jq -r '.secret // "123456789"' /data/options.json)
downloads=$(jq -r '.downloads // "/share/aria2/"' /data/options.json)
options=$(jq -r 'if .options then [.options[] | "--"+.name+"="+.value ] | join(" ") else "" end' /data/options.json)
session_file=/data/aria.session

if [ ! -f ${session_file} ]; then
    touch ${session_file}
fi

conf_file=/data/aria2.conf
if [ ! -f ${conf_file} ]; then
    touch ${conf_file}
fi

darkhttpd /webui/ --port 8080 &
#darkhttpd /webui/ariang --port 8081 &

aria2c --rpc-allow-origin-all --enable-rpc --rpc-secret=${secret} --rpc-listen-all --save-session=${session_file} --input-file=${session_file} --save-session-interval=30 --dir=${downloads} --conf-path=${conf_file} ${options}
