# Caddy Proxy addon for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-caddy-proxy.svg)](https://microbadger.com/images/bestlibre/armhf-caddy-proxy "Get your own version badge on microbadger.com")

## Description

This addon provide a [Caddy](https://caddyserver.com/) Proxy with multiple vhost support and automatic ssl (obtention and renewal). It should be a easier option than the nginx_proxy and certbot addons.

The simplier way to use it is just to set your external address in the homeassistant field.

## Configuration
### homeassistant (str)

This is a shortcut to set a proxy for homeassistant. If this option is set to "homeassistant.domain.tld" it will set a proxy from https://homeassistant.domain.tld to homeassistant:8123.

### vhosts (list of dict)

This list describe all the virtual host to be proxified. It must be set to have a valid configuration but can be empty.

#### vhost (string)

Full hostname (ie myservice.domain.tld)

#### port (string)

Internal port (ie 8123 for homeassistant, 3000 for grafana)

#### remote (str)

Ip or url for the proxified server. If not set default to 172.17.0.1 (docker host).

#### user (str)

Username to be used with basicauth. `pwd` (see below) must also be set.

#### pwd (str)

Password to be used with basicauth. `user` (see above) must also be set.

#### paths (list of str)

This list describe all the subpath to be proxified, other that the root `/`. It must be set (if the `vhosts`list is not empty) to have a valid configuration but can be empty.

Each string must have the following format :

```
<path> <remote>:<port>
```

with :

- **path** (str): path to be proxify (ie `/api/`).
- **remote** (str): Ip or url for the proxified server. Use `172.17.0.1` for the docker host.
- **port** (str): Internal port.

### email (email)

Email is the email address to use with which to generate a certificate with Let's Encrypt.

### staging (bool)

Activate staging  environment for letsencrypt. False by default.

### raw_config (list of str)

Each string will be added to the caddy configuration file as a new line, after the domain proxified with the vhosts section.

**BREAKING CHANGE** In previous version, this was a list of dict with an object of the form `{'line': str}`. The inderection was removed.
