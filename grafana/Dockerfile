ARG BUILD_FROM
FROM $BUILD_FROM

USER root

ENV GOSU_VERSION 1.10

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN if [ "$BUILD_ARCH" = "amd64" ]; then rm /usr/bin/qemu-arm-static; fi

RUN set -ex \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		jq wget \
 && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
 && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
 && chmod +x /usr/local/bin/gosu \
 && apt-get purge -y  --auto-remove wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

#USER grafana

ENTRYPOINT [ "/run_addon.sh" ]
