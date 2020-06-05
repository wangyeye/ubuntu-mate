# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04

ENV USER root

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
        apt-utils \
        vim \
        cron \
        openjdk-8-jdk \
        tightvncserver \
        mate-desktop-environment \
        supervisor \
        net-tools \
        curl \
        git \
    && apt autoclean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*
    
COPY startup.sh /root/

CMD ["/bin/bash", "/root/startup.sh"]
