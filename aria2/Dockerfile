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
 && git clone https://github.com/ziahamza/webui-aria2.git /webui-aria2 \
 && rm -rf /webui-aria2/.git \
 && rm -rf /webui-aria2/screenshots \
 && rm -rf /webui-aria2/*.md \
 && rm -rf /webui-aria2/Dockerfile* \
 && rm -rf /webui-aria2/node-server.js \
 && apk del .build-deps

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
