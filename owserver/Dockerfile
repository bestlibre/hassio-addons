ARG BUILD_FROM
FROM $BUILD_FROM

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
