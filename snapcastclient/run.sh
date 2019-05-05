#!/bin/bash
set -e
host=$(jq -r '.host // empty' /data/options.json)
soundcard=$(jq -r '.soundcard // empty' /data/options.json)
name=$(jq -r '.name // empty' /data/options.json)
if [ -n "${host}" ];
then
    host="-h ${host}"
fi
if [ -n "${soundcard}" ];
then
    soundcard="-s ${soundcard}"
fi
if [ -n "${name}" ];
then
    name="--hostID ${name}"
fi
snapclient -l
snapclient ${host} ${soundcard} ${name}
