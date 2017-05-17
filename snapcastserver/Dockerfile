FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#Install snapcastclient
RUN apk upgrade --no-cache --available \
 && apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
        snapcast-server

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
