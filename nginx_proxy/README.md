# Nginx Proxy addon for hass.io

## Description

This addon provide an Nginx Proxy with multiple vhost support and optional ssl. 

## Configuration
### ssl (bool)
If set to `false`, only http is proxified.

If set to `true`, the template used for the vhosts force https. The key and certchain must be located in
`/ssl/letsencrypt/live/${VHOST}/privkey.pem` and `/ssl/letsencrypt/live/${VHOST}/fullchain.pem`. A solution to obtain them is to used the [certbot addon](https://github.com/bestlibre/hassio-addons/tree/master/certbot).

### vhosts (list)

This list describe all the virtual host to be proxified.

#### vhost (string)

Full hostname (ie homeassistant.domain.tld)

#### port (string)

Internal port (ie 8123 for homeassistant)

#### default_server (bool)

Configure this vhost to be the default is set to true. Must only be used once.
