# Mopidy addon for hass.io

[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-mopidy.svg)](https://microbadger.com/images/bestlibre/armhf-mopidy "Get your own version badge on microbadger.com")

## Audio player for Home Assistant

This addon for hass.io add audio playing capability to the host.
Mopidy is built with those extensions :

- Mopidy-Moped
- Mopidy-GMusic
- Mopidy-Local-SQLite

The local media can be stored on /share (which allow an access through the samba addon). By default the directory for media is /share/mopidy/media. Since /share is read-only, the directory must be created from another addon or directly on the host.

Mopidy listen on `6680` for http connection, and `6600` for mpd ones.

## Configuration
### local_scan (bool)
If it is set to true, a local scan is performed on startup.

### options (list of dict)

The base configuration contains only :
````
[core]
cache_dir = /data/mopidy/cache
data_dir = /data/mopidy/data_dir

[local]
media_dir = /share/mopidy/media
library = sqlite

[m3u]
playlists_dir = /share/mopidy/playlists

[http]
hostname = 0.0.0.0

[mpd]
hostname = 0.0.0.0
````

To add other options, or overwrite existing ones, you need to add them as elements in this list. Each item must be a dict with a "name" and a "value" element.
They will be added on the mopidy call as -o name=value
For exemple, to overwrite the media configuration to use share,
````
{"name": "local/media_dir", "value": "/share/media"}
````
will become
````
-o local/media_dir=/share/media
````

To get the GMusic addon working add this to your Options:
````
{
  "local_scan": true,
  "options": [
    {
      "name": "gmusic/username",
      "value": "YourUserName"
    },
    {
      "name": "gmusic/password",
      "value": "ApplicationPassword"
    }
  ]
}
````
You can generate your application password as described here: https://support.google.com/accounts/answer/185833?hl=en 
