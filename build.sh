#!/bin/bash

./create_hassio_addon.sh -a armhf -s mopidy -p -l .
./create_hassio_addon.sh -a amd64 -s mopidy -p -l .
./create_hassio_addon.sh -a armhf -s influxdb -p -l .
./create_hassio_addon.sh -a amd64 -s influxdb -p -l .
