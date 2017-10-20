# Syncthing for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-syncthing.svg)](https://microbadger.com/images/bestlibre/armhf-syncthing "Get your own version badge on microbadger.com")

## Description

This addon provide a [syncthing](https://syncthing.net/) container for hass.io.

> Syncthing replaces proprietary sync and cloud services with something open, trustworthy and decentralized. Your data is your data alone and you deserve to choose where it is stored, if it is shared with some third party and how it's transmitted over the Internet.

When creating a new folder with the webui, you must set the folder path to something that will be persistent in case of container reboot/upgrade. You can use any of the following path :

 - `/data/<subfolder/path>` : `subfolder/path` will be created in the addon persistent volume,
 - `/data/<subfolder/path>` : `subfolder/path` will be created in the share directory, which can be accessed with samba,
 - `/config` : to synchronize home assistant configuration,
 - `/backup` : to synchronize home assistant backups,
 - `/addons` :  to synchronize hassio addons.
 
## Configuration
There are no configuration options.
