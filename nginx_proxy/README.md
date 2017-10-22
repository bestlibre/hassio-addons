# Nginx Proxy addon for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-nginx-proxy.svg)](https://microbadger.com/images/bestlibre/armhf-nginx-proxy "Get your own version badge on microbadger.com")

## Description

This addon provide an Nginx Proxy with multiple vhost support and optional ssl. 

## Configuration
### vhosts (list)

This list describe all the virtual host to be proxified.

#### vhost (string)

Full hostname (ie homeassistant.domain.tld)

#### port (string)

Internal port (ie 8123 for homeassistant)

#### default_server (bool)

Configure this vhost to be the default is set to true. Must only be used once.

#### remote (str)

Ip or url for the proxified server. If not set default to 172.17.0.1 (docker host).

#### auth (str)

Enables HTTP basic auth for a single user on a vhost. The string is dumped
directly to a file and used as the auth_basic_user_file. See the documentation
for
[auth_basic_user_file](http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html#auth_basic_user_file)
on how to format the value.

#### certname (str)
If not set, only http is proxified. If set, the template used for the vhosts force https. 

The key and certchain must be located in
`/ssl/letsencrypt/live/${certname}/privkey.pem` and `/ssl/letsencrypt/live/${certname}/fullchain.pem`. A solution to obtain them is to used the [certbot addon](https://github.com/bestlibre/hassio-addons/tree/master/certbot).

#### ssl_modern (bool)
If certname is set, you can set this parameter to switch betwwen ssl profils. The profile are the ones defined by the [mozilla ssl config generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/). Use the [modern one](https://wiki.mozilla.org/Security/Server_Side_TLS#Modern_compatibility) is set to `true`, the [intermediate one](https://wiki.mozilla.org/Security/Server_Side_TLS#Intermediate_compatibility_.28default.29) is set to `false`or not set.

## Usage exemple
I proxyfy 4 services, 3 local to the pi, one on another host. My configs, for 4 subdomains, with two different certs (one for each physical hosts) are :

### nginx proxy :
````
{
  "vhosts": [
    {
      "vhost": "sub1.redacted.tld",
      "default_server": true,
      "certname": "rpi",
      "port": "8123"
    },
    {
      "vhost": "sub2.redacted.tld",
      "port": "3380",
      "default_server": false,
      "certname": "rpi"
    },
    {
      "vhost": "sub3.redacted.tld",
      "certname": "rpi",
      "port": "3000"
    },
    {
      "remote": "192.168.0.2",
      "vhost": "sub4.redacted.tld",
      "certname": "nas",
      "port": "443"
    }
  ]
}
````
### certbot :
````
{
  "email": "contact@redacted.tld",
  "certificats": [
    {
      "domains": "sub1.redacted.tld,sub2.redacted.tld,sub3.redacted.tld",
      "name": "rpi"
    },
    {
      "domains": "sub3.redacted.tld",
      "name": "nas"
    }
  ],
  "ssl_only": false
}
````
