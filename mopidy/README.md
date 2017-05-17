# Mopidy addon for hass.io

## Audio player for Home Assistant

This addon for hass.io add audio playing capability to the host.
Mopidy is built with those extensions :

- Mopidy-Moped
- Mopidy-GMusic

## Configuration

### options (list of dict)

The base configuration contains only :
````
[core]
cache_dir = /data/mopidy/cache
data_dir = /data/mopidy/data_dir

[local]
media_dir = /data/mopidy/media

[m3u]
playlists_dir = /data/mopidy/playlists

[http]
hostname = 0.0.0.0

[mpd]
hostname = 0.0.0.0
````

To add other options, or overwrite existing ones, you need to add them as elements in this list. Each item must be a dict with a "name" and a "value" element.
They will be added on the mopidy call as -o name=value
For exemple
````
{"name": "gmusic/username", "value": "user@gmail.com"}
````
will become
````
-o gmusic/username=user@gmail.com
````
