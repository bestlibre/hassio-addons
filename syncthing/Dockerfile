FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8
ENV GOPATH /opt/go

ENV SYNCTHING_VERSION v0.14.29
# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        build-base \
        git \
	go \
 && mkdir -p $GOPATH/src/github.com/syncthing \
 && cd $GOPATH/src/github.com/syncthing \
 && git clone https://github.com/syncthing/syncthing \
 && cd syncthing \
 && git checkout $SYNCTHING_VERSION \
 && go run build.go -version $SYNCTHING_VERSION -no-upgrade install \
 && cp bin/syncthing /usr/bin/ \
 && cd /opt \
 && rm -rf go \
 && apk del .build-deps
 
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
