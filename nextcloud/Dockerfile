ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

COPY qemu-arm-static /usr/bin/qemu-arm-static
COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN if [ "$BUILD_ARCH" = "armhf" ]; then rm /usr/bin/qemu-aarch64-static;\
    elif [ "$BUILD_ARCH" = "aarch64" ]; then rm /usr/bin/qemu-arm-static;\
    else\
    rm /usr/bin/qemu-aarch64-static;\
    rm /usr/bin/qemu-arm-static;\
    fi

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

RUN sed -i "s|/var/www|/data/www|g" /etc/apache2/sites-enabled/000-default.conf \
 && sed -i "s|/var/www|/data/www|g" /etc/apache2/apache2.conf \
 && sed -i "s|/var/www/html|/data/www/html|g" /entrypoint.sh \
 && sed -i "s|/var/www/html|/data/www/html|g" /usr/src/nextcloud/config/autoconfig.php

COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

ENTRYPOINT [ "/run_addon.sh" ]
CMD ["apache2-foreground"]
