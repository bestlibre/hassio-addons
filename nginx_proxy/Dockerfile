ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8
ENV GOPATH /opt/go

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        build-base \
        git \
	go \
 && apk add -U --no-cache \
        libressl \
        jq \
        nginx \
 && go get -u github.com/quantumew/mustache-cli \
 && cp $GOPATH/bin/* /usr/local/bin/ \
 && rm -rf $GOPATH \
 && apk del .build-deps


# Copy data
COPY run.sh /
COPY vhost.mustache /templates/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/* && \
    mkdir -p /run/nginx
COPY commons.conf /etc/nginx/conf.d/

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
