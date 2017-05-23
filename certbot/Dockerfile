FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add -U --no-cache jq \
 && apk add -U --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community certbot

# Copy data
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
