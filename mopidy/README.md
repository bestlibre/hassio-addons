# Mopidy addon for hass.io

[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-mopidy.svg)](https://microbadger.com/images/bestlibre/armhf-mopidy "Get your own version badge on microbadger.com")

## Audio player for Home Assistant

This addon for hass.io add audio playing capability to the host.
Mopidy is built with those extensions :

- Mopidy-Moped
- Mopidy-GMusic
- Mopidy-Local-SQLite
- Mopidy-Spotify
- Mopidy-Iris

The local media can be stored on /share (which allow an access through the samba addon). By default the directory for media is /share/mopidy/media. Since /share is read-only, the directory must be created from another addon or directly on the host.

Mopidy listen on `6680` for http connection, and `6600` for mpd ones.

This is a debian based addon since mopidy-spotify is not compatible with alpine.

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

## Google Music support
To get the GMusic addon working add this to your options section:
````
{
   "name": "gmusic/username",
   "value": "YourUserName"
},
{
	"name": "gmusic/password",
	"value": "ApplicationPassword"
}
````

You can generate your application password as described [here](https://support.google.com/accounts/answer/185833?hl=en).

Other options are available, check [the official doc](https://github.com/mopidy/mopidy-gmusic#configuration) for the complete list

## Spotify Support
To get the Spotify addon working, before starting Mopidy, you must add your Spotify Premium username and password to your Mopidy configuration file and also visit https://www.mopidy.com/authenticate/#spotify to authorize this extension against your Spotify account:
````
{
   "name": "spotify/username",
   "value": "YourUserName"
},
{
	"name": "spotify/password",
	"value": "ApplicationPassword"
}
````
The following configuration values are available:
````
spotify/enabled: If the Spotify extension should be enabled or not. Defaults to true.
spotify/username: Your Spotify Premium username. You must provide this.
spotify/password: Your Spotify Premium password. You must provide this.
spotify/client_id: Your Spotify application client id. You must provide this.
spotify/client_secret: Your Spotify application secret key. You must provide this.
spotify/bitrate: Audio bitrate in kbps. 96, 160, or 320. Defaults to 160.
spotify/volume_normalization: Whether volume normalization is active or not. Defaults to true.
spotify/timeout: Seconds before giving up waiting for search results, etc. Defaults to 10.
spotify/allow_cache: Whether to allow caching. The cache is stored in a "spotify" directory within Mopidy's core/cache_dir. Defaults to true.
spotify/allow_network: Whether to allow network access or not. Defaults to true.
spotify/allow_playlists: Whether or not playlists should be exposed. Defaults to true.
spotify/search_album_count: Maximum number of albums returned in search results. Number between 0 and 50. Defaults to 20.
spotify/search_artist_count: Maximum number of artists returned in search results. Number between 0 and 50. Defaults to 10.
spotify/search_track_count: Maximum number of tracks returned in search results. Number between 0 and 50. Defaults to 50.
spotify/toplist_countries: Comma separated list of two letter ISO country codes to get toplists for. Defaults to blank, which is interpreted as all countries that Spotify is available in.
spotify/private_session: Whether to use a private Spotify session. Turn on private session to disable sharing of played tracks with friends through the Spotify activity feed, Last.fm scrobbling, and Facebook. This only affects social sharing done by Spotify, not by other Mopidy extensions. Defaults to false.
````

## Complete example
This a working configuration example, with Google Music and local scan.

````
{
  "local_scan": true,
  "options": [
    {
      "name": "local/media_dir",
      "value": "/share/mopidy/media"
    },
    {
      "name": "m3u/playlists_dir",
      "value": "/share/mopidy/playlists/"
    },
    {
      "name": "gmusic/username",
      "value": "MYUSER"
    },
    {
      "name": "gmusic/password",
      "value": "MYPASSWORD"
    }
  ]
}
````
