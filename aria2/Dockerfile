ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        git \
 && apk add --no-cache -U aria2 darkhttpd jq \
 && git clone https://github.com/ziahamza/webui-aria2.git /tmp_webui \
 && mv /tmp_webui/docs /webui-aria2 \
 && rm -rf /tmp_webui \
 && apk del .build-deps

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
