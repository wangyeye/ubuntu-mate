FROM ubuntu:18.04

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
