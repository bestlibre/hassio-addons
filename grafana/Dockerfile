#amd64:FROM grafana/grafana:%%UPSTREAM_VERSION%%
#armhf:FROM fg2it/grafana-armhf:v%%UPSTREAM_VERSION%%

COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

CMD [ "/run_addon.sh" ]
