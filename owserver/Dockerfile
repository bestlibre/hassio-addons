#armhf:FROM bestlibre/armhf-debian-base:stretch
#aarch64:FROM bestlibre/aarch64-debian-base:stretch
#amd64:FROM debian:stretch
#i386:FROM i386/debian:stretch

ENV LANG C.UTF-8

RUN set -ex \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                owserver \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache \
 && update-rc.d owserver disable


# Copy data for add-on
COPY owfs.conf /etc/owfs.conf
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 4304
CMD [ "/run.sh" ]
