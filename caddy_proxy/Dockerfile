FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8
ENV ARCH %%ARCH%%
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
 && if [ $ARCH == "armhf" ]; then caddyurl=linux/arm7;\
    elif [ $ARCH == "amd64" ]; then caddyurl=linux/amd64;\
    elif [ $ARCH == "i386" ]; then caddyurl=linux/386;\
    elif [ $ARCH == "aarch64" ]; then caddyurl=linux/arm64;\
    fi \
 && echo $caddyurl \
 && curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/$caddyurl" \
    | tar --no-same-owner -C /usr/local/bin/ -xz caddy \
 && chmod 0755 /usr/local/bin/caddy \
 && addgroup -S caddy \
 && adduser -D -S -H -s /sbin/nologin -G caddy caddy \

 && apk del .build-deps


# Copy data
COPY run.sh /
COPY vhost.mustache /templates/

RUN chmod a+x /run.sh

USER caddy

CMD [ "/run.sh" ]
