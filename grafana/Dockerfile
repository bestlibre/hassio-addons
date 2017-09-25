#amd64:FROM grafana/grafana:%%UPSTREAM_VERSION%%
#armhf:FROM fg2it/grafana-armhf:v%%UPSTREAM_VERSION%%

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

CMD [ "/run_addon.sh" ]
