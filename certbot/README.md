# Certbot (let's encrypt) addon for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-certbot.svg)](https://microbadger.com/images/bestlibre/armhf-certbot "Get your own version badge on microbadger.com")

## Certificat creation and renewal for hass.io

This addon is intented to be used with [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy). It will obtain and renew if necessary the certificats from [Let's encrypt](https://letsencrypt.org/) with [certbot](https://certbot.eff.org/). It use the webroot plugin and need `DOMAIN/.well-known` directories to be served from `/ssl/wk`. [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy) does this for you.

The certificats are created in `/ssl/letsencrypt/live/$NAME/`for each certificat.

## Configuration

### email (email)

Email address used for the registration

### certificats (list of objects)
#### name (str)
Certificat name, for directory creation.
#### domains (str)
List of domains to create/renew certificats, comma separated

### debug (bool)

If set to true, certbot logs will be printed in the docker logs.
