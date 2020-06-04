# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04

ENV USER root

RUN apt-get update \
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
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
    
COPY startup.sh /root/

CMD ["/bin/bash", "/root/startup.sh"]
