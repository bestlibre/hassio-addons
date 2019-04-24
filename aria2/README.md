# aria2 with webui for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-aria2.svg)](https://microbadger.com/images/bestlibre/armhf-aria2 "Get your own version badge on microbadger.com")

## Description

This addon provide an [aria2](https://aria2.github.io/) with the [webui-aria2](https://github.com/ziahamza/webui-aria2) frontend container for hass.io.

`rpc` is enabled and session are saved in `/data`

## Configuration

### downloads (str)

Path to the directory used for download storage. Default to `/share/aria2`

### secret (str)

Secret for rpc connection. Default to `123456789`

### options (list of dict)

Additional options passed to aria2c. Must be entered as a list of dictionaries with this format : `{"name": "...", "value": "..."}`
