#!/bin/bash

addon=$1
do
    for arch in "armhf" "amd64"
    do
	./create_hassio_addon.sh -a $arch -s $addon -p -l . 
    done
done
