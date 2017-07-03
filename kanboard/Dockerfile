FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

ENV KANBOARD_VERSION 1.0.44

# Add Tini
ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-%%ARCH%% /tini
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

RUN apk add -U --no-cache --virtual .build-deps unzip wget\
 && apk add --no-cache nginx openssl php7 php7-fpm php7-pdo_sqlite php7-gd php7-json php7-ctype php7-session php7-mbstring php7-openssl php7-zip php7-zlib \
 && cd /tmp \
 && wget https://kanboard.net/kanboard-${KANBOARD_VERSION}.zip \
 && unzip -d /var/www/ kanboard-${KANBOARD_VERSION}.zip \
 && rm kanboard-${KANBOARD_VERSION}.zip \
 && apk del .build-deps \
 && echo "daemon off;" >> /etc/nginx/nginx.conf \
 && rm /etc/nginx/conf.d/* \
 && mkdir -p /run/nginx

COPY config.php /var/www/kanboard/
COPY kanboard.conf /etc/nginx/conf.d/

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 80

CMD [ "/run.sh" ]
