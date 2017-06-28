# Certbot (let's encrypt) addon for hass.io
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-certbot.svg)](https://microbadger.com/images/bestlibre/armhf-certbot "Get your own version badge on microbadger.com")

## Certificat creation and renewal for hass.io

This addon is intented to be used with [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy). It will obtain and renew if necessary the certificats from [Let's encrypt](https://letsencrypt.org/) with [certbot](https://certbot.eff.org/). It use the webroot plugin and need `DOMAIN/.well-known` directories to be served from `/ssl/wk`. [nginx_proxy](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy) does this for you.

The certificats are created in `/ssl/letsencrypt/live/$NAME/`for each certificat.

## Configuration

### email (email)

Email address used for the registration

### ssl-only (bool)

Option to use this addon in a situation where the certbot ``webroot`` plugin is not usable (ie no access on port 80). This option will anable the ``standalone`` plugin with the ``--preferred-challenges tls-sni`` option. Port 443 inside the addon is exposed as 10443 on the host. You can use the [nginx proxy addon](https://github.com/bestlibre/hassio-addons/tree/master/nginx_proxy) to proxify it back to 443.

Some extra actions are needed to use this method, since you cannot proxify both the service behind a given virtual host and certbot at the same time :

-  modify the nginx_proxy configuration to proxify 443 to 10443,
-  start the certbot addon,
-  wait for the certificats to be created/renewed,
-  stop the addon,
-  revert the nginx conf


### certificats (list of objects)
#### name (str)
Certificat name, for directory creation.
#### domains (str)
List of domains to create/renew certificats, comma separated

### debug (bool)

If set to true, certbot logs will be printed in the docker logs.
