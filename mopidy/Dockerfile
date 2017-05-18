FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#Install mopidy
RUN echo "http://nl.alpinelinux.org/alpine/v3.5/main" > /etc/apk/repositories \
 && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk upgrade --no-cache --available \
 && apk add --no-cache --virtual .build-deps \
 	build-base \
	git \
 && apk add --no-cache \
        ca-certificates \
        gst-plugins-bad1 \
        gst-plugins-good1 \
        gst-plugins-ugly1 \
	jq \
        py-gst1 \
        py-pip \
        python \
	python-dev \
 && pip install -U pip \
 && pip install \
        mopidy \
    	pyasn1==0.1.8 \
        Mopidy-Moped \
        Mopidy-GMusic \
	Mopidy-Local-SQLite \
 && apk del .build-deps

COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
