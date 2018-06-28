ARG BUILD_FROM
FROM $BUILD_FROM

USER root

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN if [ "$BUILD_ARCH" = "amd64" ]; then rm /usr/bin/qemu-arm-static; fi

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

USER grafana

ENTRYPOINT [ "/run_addon.sh" ]
