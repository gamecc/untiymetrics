#!/usr/bin/docker build .
#
# VERSION               1.0
# MOD Unisphere 1.1 by Gamecc

FROM     telegraf
MAINTAINER gamecc

ENV HOSTNAME unitymetrics
ENV VI_IMAGE 1

# create file to see if this is the firstrun when started
RUN touch /firstrun

# Install Unispherecli
COPY ./unitymetrics /usr/bin
COPY ./unitymetrics /usr/sbin
RUN chmod +x /usr/bin/unitymetrics
RUN chmod +x /usr/sbin/unitymetrics

ENTRYPOINT ["./startup.sh"]
CMD ["sh", "-c", "telegraf --config $CFGX"]
