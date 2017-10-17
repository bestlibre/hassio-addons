ARG BUILD_FROM
FROM $BUILD_FROM

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

ENTRYPOINT [ "/run_addon.sh" ]
