ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

ENV LANG C.UTF-8
ENV SNAPCAST_VERSION 0.11.1
#Install snapcast-server
RUN set -ex \
    # Official Mopidy install for Debian/Ubuntu along with some extensions
    # (see https://docs.mopidy.com/en/latest/installation/debian/ )
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
 && curl -L https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}_${BUILD_ARCH}.deb -o /tmp/snapcastserver.deb \
 && dpkg -i /tmp/snapcastserver.deb || DEBIAN_FRONTEND=noninteractive apt-get install -f -y\
 && apt-get purge --auto-remove -y \  
        curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

COPY mopidy_cast.conf /var/lib/mopidy/.config/mopidy/mopidy_cast.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680 1704 1705


CMD [ "/run.sh" ]
