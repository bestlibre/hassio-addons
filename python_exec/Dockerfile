FROM %%BASE_IMAGE%%

# Add env
ENV LANG C.UTF-8

RUN apk add --no-cache \
        py-pip \
	python \
	python-dev\
 && pip install -U pip

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
