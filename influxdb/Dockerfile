FROM %%BASE_IMAGE%%

ENV VERSION %%VERSION%%
ENV LANG C.UTF-8

#Install influxdb
RUN apk upgrade --no-cache --available \
 && apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
        influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 8086
CMD [ "/run.sh" ]
