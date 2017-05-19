FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add -U --no-cache gettext jq nginx libressl

# Copy data
COPY run.sh /
COPY vhost.tpl /templates/
COPY vhost_nossl.tpl /templates/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/* && \
    mkdir -p /run/nginx
COPY commons.conf /etc/nginx/conf.d/

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
