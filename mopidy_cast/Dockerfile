FROM bestlibre/%%ARCH%%-mopidy

ENV LANG C.UTF-8

#Install snapcast-server
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
        snapcast-server

# Add Tini
ENV TINI_VERSION v0.14.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-%%ARCH%% /tini
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]

COPY mopidy_cast.conf /var/lib/mopidy/.config/mopidy/mopidy_cast.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680 1704 1705


CMD [ "/run.sh" ]
