ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH
# Add env
ENV LANG C.UTF-8

# Setup base

RUN apk add --no-cache -U --virtual .build-deps \
	git \
 && apk add -U --no-cache \
        jq \
	py-pip \
	python \
	python-dev \
 && mkdir /cw \
 && cd /cw \
 && git clone https://github.com/janeczku/calibre-web.git .\
 && pip install -r requirements.txt --target vendor

# Copy data
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
