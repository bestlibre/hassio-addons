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

#### certname (str)
If not set, only http is proxified. If set, the template used for the vhosts force https. 

The key and certchain must be located in
`/ssl/letsencrypt/live/${certname}/privkey.pem` and `/ssl/letsencrypt/live/${certname}/fullchain.pem`. A solution to obtain them is to used the [certbot addon](https://github.com/bestlibre/hassio-addons/tree/master/certbot).

#### ssl_modern (bool)
If certname is set, you can set this parameter to switch betwwen ssl profils. The profile are the ones defined by the [mozilla ssl config generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/). Use the [modern one](https://wiki.mozilla.org/Security/Server_Side_TLS#Modern_compatibility) is set to `true`, the [intermediate one](https://wiki.mozilla.org/Security/Server_Side_TLS#Intermediate_compatibility_.28default.29) is set to `false`or not set.
