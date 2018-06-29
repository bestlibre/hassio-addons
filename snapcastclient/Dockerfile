ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH

ENV LANG C.UTF-8
#Install snapcast-server
RUN set -ex \
    # Official Mopidy install for Debian/Ubuntu along with some extensions
    # (see https://docs.mopidy.com/en/latest/installation/debian/ )
 && SNAPCAST_VERSION=v${BUILD_VERSION%-*} \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl jq \
 && curl -L https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapclient_${SNAPCAST_VERSION}_${BUILD_ARCH}.deb -o /tmp/snapcastclient.deb \
 && dpkg -i /tmp/snapcastclient.deb || DEBIAN_FRONTEND=noninteractive apt-get install -f -y\
 && apt-get purge --auto-remove -y \  
        curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
