FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#Install mopidy
RUN apk add --no-cache --virtual .build-deps \
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
    	pyasn1 \
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
