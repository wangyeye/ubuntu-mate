# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04

ENV HOME=/root \
    USER=root \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai
    
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        apt-utils \
        vim \
        cron \
        openjdk-8-jdk \
        tightvncserver \
        ubuntu-mate-desktop \
        supervisor \
        net-tools \
        curl \
        git \
    && apt autoclean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*
    
COPY startup.sh /root/

CMD ["/bin/bash", "/root/startup.sh"]
