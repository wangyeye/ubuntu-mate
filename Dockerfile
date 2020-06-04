# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04


## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1440x900 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

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
        pwgen \
    && apt-get autoclean \
    && apt-get autoremove \
