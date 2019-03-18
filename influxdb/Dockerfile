ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

ENV LANG C.UTF-8

COPY qemu-arm-static /usr/bin/qemu-arm-static
COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN if [ "$BUILD_ARCH" = "armhf" -o "$BUILD_ARCH" = "armv7" ]; then rm /usr/bin/qemu-aarch64-static;\
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

COPY influxdb.conf /etc/influxdb/influxdb.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 8086
EXPOSE 8088
ENTRYPOINT [ "/run.sh" ]
CMD ["influxd"]