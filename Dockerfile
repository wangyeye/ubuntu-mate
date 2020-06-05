FROM ubuntu:18.04

ENV HOME=/root \
    USER=root \
    TZ=Asia/Shanghai

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
