ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        git \
        unzip \
        wget \
 && apk add --no-cache -U aria2 darkhttpd jq \
 && mkdir /webui \
 && git clone https://github.com/ziahamza/webui-aria2.git /tmp_webui \
 && mv /tmp_webui/docs /webui/webui-aria2 \
 && rm -rf /tmp_webui \
 && mkdir /webui/ariang \
 && cd /webui/ariang \
 && wget -O ariang.zip https://github.com/mayswind/AriaNg/releases/download/1.2.1/AriaNg-1.2.1.zip \
 && unzip ariang.zip \
 && rm ariang.zip \
 && apk del .build-deps

COPY run.sh /
COPY index.html /webui/
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
