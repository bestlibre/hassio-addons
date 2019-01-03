ARG BUILD_FROM
FROM $BUILD_FROM as BUILDER

ARG BUILD_VERSION
ARG BUILD_ARCH

RUN set -ex \
 && SNAPCAST_VERSION=${BUILD_VERSION%-*} \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl jq git build-essential libasound2-dev libvorbisidec-dev libvorbis-dev libflac-dev alsa-utils libavahi-client-dev avahi-daemon \
	build-essential debhelper dh-make dh-systemd quilt fakeroot lintian \
 && cd /tmp/ \
 && git clone https://github.com/badaix/snapcast.git \
 && cd snapcast \
 && git checkout v${SNAPCAST_VERSION} \
 && cd externals \
 && git submodule update --init --recursive
RUN cd /tmp/snapcast/client \
 && make dpkg \
 && mv $(ls ../snapclient*.deb) /snapclient.deb

ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH

ENV LANG C.UTF-8

COPY --from=BUILDER /snapclient.deb /tmp/
#Install snapcast-server
RUN set -ex \
    # Official Mopidy install for Debian/Ubuntu along with some extensions
    # (see https://docs.mopidy.com/en/latest/installation/debian/ )
 && SNAPCAST_VERSION=${BUILD_VERSION%-*} \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        jq \
 && dpkg -i /tmp/snapclient.deb || DEBIAN_FRONTEND=noninteractive apt-get install -f -y\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
