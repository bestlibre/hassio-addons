ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        build-base \
 && apk add -U --no-cache \
        libressl \
        jq \
        nginx \
        python3 \
	    python3-dev \
 && pip3 install -U pip \
 && pip install pystache \
 && apk del .build-deps


# Copy data
COPY run.sh /
COPY mustache.py /
COPY vhost.mustache /templates/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/* && \
    mkdir -p /run/nginx
COPY commons.conf /etc/nginx/conf.d/

RUN chmod a+x /run.sh
RUN chmod a+x /mustache.py

CMD [ "/run.sh" ]
