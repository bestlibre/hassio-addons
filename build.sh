#!/bin/bash

for addon in "mopidy" "influxdb" "snapcastclient" "snapcastserver"
do
    for arch in "armhf" "amd64"
    do
	./create_hassio_addon.sh -a $arch -s $addon -p -l .
    done
done
