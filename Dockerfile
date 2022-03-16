#!/usr/bin/docker build .
#
# VERSION               1.0
# MOD Unisphere 1.1 by Gamecc

FROM       ubuntu:latest
MAINTAINER gamecc

ENV HOSTNAME unitymetrics
ENV VI_IMAGE 1

# create file to see if this is the firstrun when started
RUN touch /firstrun

#RUN apk update && apk add \
RUN apk update && apk add \
    bash \
    wget \
    supervisor \
    net-tools \
    bind-tools \
    libxml2-utils \
    openssh-client \
    openssh-server \
    vim \
    sudo \
    less \
    ed \
    make \
    tar 

# Install Unispherecli
COPY unitymetrics /usr/bin
COPY unitymetrics /usr/sbin
RUN chmod +x /usr/bin/unitymetrics
RUN chmod +x /usr/sbin/unitymetrics

#Install telegraf
RUN wget https://repos.influxdata.com/ubuntu/pool/stable/t/telegraf/telegraf_1.21.4-1_amd64.deb 
RUN dpkg -i telegraf_1.21.4-1_amd64.deb 

# Cleanup
RUN apt-get clean

# setup default user
RUN addgroup -S unityadmin 
RUN adduser -S unityadmin -G unityadmin -s /bin/bash
RUN echo 'unityadmin:untyadm!n' | chpasswd
RUN echo '%unityadmin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# expose ports for SSH, HTTP, HTTPS
#EXPOSE 22 80 443

#COPY configs/crontab /var/spool/cron/crontabs/stor2rrd
#RUN chmod 640 /var/spool/cron/crontabs/stor2rrd && chown stor2rrd.cron /var/spool/cron/crontabs/stor2rrd

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

#RUN mkdir -p /home/lpar2rrd/lpar2rrd/data
#RUN mkdir -p /home/lpar2rrd/lpar2rrd/etc
# volume for persistant configuration (Telegraf)
VOLUME [ "/unity" ]

ENTRYPOINT [ "/startup.sh" ]
