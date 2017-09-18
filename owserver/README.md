# one wire server
[![Build Status](https://travis-ci.org/bestlibre/hassio-addons.svg?branch=master)](https://travis-ci.org/bestlibre/hassio-addons)[![](https://images.microbadger.com/badges/version/bestlibre/armhf-owserver.svg)](https://microbadger.com/images/bestlibre/armhf-owserver "Get your own version badge on microbadger.com")

Addon to expose one wire sensors over a tcp server ([owserver](http://owfs.org/index.php?page=owserver)), using `/dev/i2c-1` as input device. Can be use with [pyownet](http://pyownet.readthedocs.io/en/latest/index.html) to interact with sensors in python.

I'm using it to read sensor values over an I2C to 1wire converter (cf [this page for inspiration](http://raspberrypi.tomasgreno.cz/thermal-sensor-i2c.html))
