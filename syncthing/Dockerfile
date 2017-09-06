FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8
ENV ARCH %%ARCH%%
ENV SYNCTHING_VERSION v%%UPSTREAM_VERSION%%

# Setup base
RUN apk add --no-cache -U --virtual .build-deps \
        curl \
	tar \
 && if [ $ARCH == "armhf" ]; then syncthingarch=arm;\
    elif [ $ARCH == "amd64" ]; then syncthingarch=amd64;\
    elif [ $ARCH == "i386" ]; then syncthingarch=386;\
    elif [ $ARCH == "aarch64" ]; then syncthingarch=arm64;\
    fi \
 && syncthingurl=https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/syncthing-linux-${syncthingarch}-${SYNCTHING_VERSION}.tar.gz \
 && curl --silent --show-error --fail --location --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "$syncthingurl" \
    | tar --no-same-owner -C /usr/local/bin/ -xz --strip-components 1 syncthing-linux-${syncthingarch}-${SYNCTHING_VERSION}/syncthing \
 && chmod 0755 /usr/local/bin/syncthing \
 && apk del .build-deps
 
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
