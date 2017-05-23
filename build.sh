#!/bin/bash

addon=$1

archs=$(jq -r '.arch // ["armhf","amd64","aarch64","i386"] | .[]' ${addon}/config.json)

for arch in $archs
do
	echo ./create_hassio_addon.sh -a $arch -s $addon -p -l . 
done
