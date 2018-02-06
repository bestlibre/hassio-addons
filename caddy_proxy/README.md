# Caddy Proxy addon for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-caddy-proxy.svg)](https://microbadger.com/images/bestlibre/armhf-caddy-proxy "Get your own version badge on microbadger.com")

## Description

This addon provide a [Caddy](https://caddyserver.com/) Proxy with multiple vhost support and automatic ssl (obtention and renewal). It should be a easier option than the nginx_proxy and certbot addons.

The simplier way to use it is just to set your external address in the homeassistant field.

## Configuration
### homeassistant (str)

This is a shortcut to set a proxy for homeassistant. If this option is set to "homeassistant.domain.tld" it will set a proxy from https://homeassistant.domain.tld to homeassistant:8123.

### vhosts (list)

This list describe all the virtual host to be proxified.

#### vhost (string)

Full hostname (ie myservice.domain.tld)

#### port (string)

Internal port (ie 8123 for homeassistant, 3000 for grafana)

#### remote (str)

Ip or url for the proxified server. If not set default to 172.17.0.1 (docker host).

### email (email)

Email is the email address to use with which to generate a certificate with Let's Encrypt.

### raw_config (list)

#### line (str)
Each line will be added to the caddy configuration file, after the domain proxified with the vhosts section.
