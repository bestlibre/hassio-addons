# Certbot (let's encrypt) addon for hass.io

## Certificat creation and renewal for hass.io

This addon is intented to be used with [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy). It will obtain and renew if necessary the certificats from [Let's encrypt](https://letsencrypt.org/) with [certbot](https://certbot.eff.org/). It use the webroot plugin and need `DOMAIN/.well-known` directories to be served from `/ssl/wk`. [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy) does this for you.

The certificats are created in `/ssl/letsencrypt/live/$NAME/`for each certificat.

## Configuration

### email (email)

Email address used for the registration

### certificats (list of objects)
#### name (str)
Certificat name, for directory creation.
#### domains (list of string)
List of domains to create/renew certificats

### debug (bool)

If set to true, certbot logs will be printed in the docker logs.
