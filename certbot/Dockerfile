ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add -U --no-cache jq py-future \
 && apk add -U --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community certbot

# Copy data
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
