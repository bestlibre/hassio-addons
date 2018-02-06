ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH
# Add env
ENV LANG C.UTF-8

# Setup base

RUN apk add --no-cache -U --virtual .build-deps \
	wget \
	unzip \
 && apk add -U --no-cache \
        jq \
	nginx \
	php7 \
	php7-cgi \
	php7-ctype \
	php7-dom \
	php7-fpm \
	php7-gd \
	php7-intl \
	php7-mcrypt \
	php7-pdo_sqlite \
	php7-session \
	php7-xml \
	sqlite \
 && BBS_VERSION=${BUILD_VERSION%-*} \
 && bbsurl=http://projekte.textmulch.de/bicbucstriim/downloads/BicBucStriim-${BBS_VERSION}.zip \
 && cd /tmp \
 && wget "$bbsurl" \
 && unzip BicBucStriim-${BBS_VERSION}.zip \
 && mkdir /var/www/bbs \
 && mv BicBucStriim-${BBS_VERSION}/* /var/www/bbs \
 && chmod -R ga+w /var/www/bbs/data \
 && apk del .build-deps \
 && rm -rf /tmp/BicBucStriim-* \
 && echo "daemon off;" >> /etc/nginx/nginx.conf \
 && rm /etc/nginx/conf.d/* \
 && mkdir -p /run/nginx

# Copy data
COPY run.sh /
COPY bbs.conf /etc/nginx/conf.d/

RUN chmod a+x /run.sh

VOLUME /var/www/bbs/data

CMD [ "/run.sh" ]
