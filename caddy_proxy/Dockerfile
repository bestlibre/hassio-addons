ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH
# Add env
ENV LANG C.UTF-8

ENV GOPATH /opt/go

# Setup base

RUN apk add --no-cache -U --virtual .build-deps \
	build-base \
	curl \
	git \
	go \
	tar \
 && apk add -U --no-cache \
        jq \
 && go get -u github.com/quantumew/mustache-cli \
 && cp $GOPATH/bin/* /usr/local/bin/ \
 && rm -rf $GOPATH \
 && CADDY_VERSION=v${BUILD_VERSION%-*} \
 && if [ ${BUILD_ARCH} == "armhf" ]; then caddyarch=arm7;\
    elif [ ${BUILD_ARCH} == "amd64" ]; then caddyarch=amd64;\
    elif [ ${BUILD_ARCH} == "i386" ]; then caddyarch=386;\
    elif [ ${BUILD_ARCH} == "aarch64" ]; then caddyarch=arm64;\
    fi \
 && caddyurl=https://github.com/mholt/caddy/releases/download/${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_${caddyarch}.tar.gz \
 && echo $caddyurl \
 && curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "$caddyurl" \
    | tar --no-same-owner -C /usr/local/bin/ -xz caddy \
 && chmod 0755 /usr/local/bin/caddy \
 && apk del .build-deps

# Copy data
COPY run.sh /
COPY vhost.mustache /templates/

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
