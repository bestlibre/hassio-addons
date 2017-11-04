# InfluxDB server for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-influxdb.svg)](https://microbadger.com/images/bestlibre/armhf-influxdb "Get your own version badge on microbadger.com")

## Description

This addon provide an influxdb database to [store data from homeassistant](https://home-assistant.io/components/influxdb/) and/or use it for [data retrieval](https://home-assistant.io/components/sensor.influxdb/).

This a wrapper around the official influxdb image.

The data are stored in the addon /data volume. You can create a backup with the `influxd`command. See the documentation [here](https://docs.influxdata.com/influxdb/v1.2/administration/backup_and_restore/) and especialy the [remote backups section](https://docs.influxdata.com/influxdb/v1.2/administration/backup_and_restore/#remote-backups).

To create the database on first run, you can use the [http api](https://docs.influxdata.com/influxdb/v1.3/guides/writing_data/) : 
```
curl -i -XPOST http://hassio.local:8086/query --data-urlencode "q=CREATE DATABASE home_assistant"
```
If this doesn't work, try to replace ̀hassio.local` with your hassio IP.

## Configuration

### env_var (dict)

This variable can be used to set environment variable before launching influxdb, and thus setting configuration variable. The list of variables is [here](https://docs.influxdata.com/influxdb/v1.3/administration/config). 

For exemple, to enable authentication :
``` python
{"env_var": [{"name": "INFLUXDB_HTTP_AUTH_ENABLED", "value": "true"}]}
```
