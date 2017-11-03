# Grafana addon for hass.io on armhf/amd64

This addon provide grafana for the armhf architecture (rpi 2 - 3) and amd64. The docker image used is build by [f2git](https://hub.docker.com/r/fg2it/grafana-armhf) for armhf and the [official image](https://hub.docker.com/r/grafana/grafana/) for amd64. The greatest common version is used. Environment variables are used to configure persistance volume to `/data` instead of `/var/lib/grafana`.

I have tried to build a grafana addon based on alpine, but failed for lack of phantomjs support.

## env_var (dict)

This variable can be used to set environment variables before launching grafana, and thus setting configuration variable. The list of variables is [here](http://docs.grafana.org/installation/configuration/). 

For exemple, to change the instance name:
``` python
{
  "env_var": [
    {
      "name": "GF_DEFAULT_INSTANCE_NAME",
      "value": "my-instance"
    }
  ]
}
```
