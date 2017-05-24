#!/bin/bash
set -e

if [ ! -f '/data/config.xml' ]; then
    # Run syncthing to generate initial configuration files, then edit
    # config.xml to remove 127.0.0.1 limit from the GUI address.
    /syncthing -generate=/data
    sed -i 's/<address>127.0.0.1:8384<\/address>/<address>:8384<\/address>' /data/config.xml
fi
syncthing -no-browser -home=/data/

