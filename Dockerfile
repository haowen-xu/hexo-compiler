FROM node:latest
LABEL maintainer="Haowen Xu <haowen-xu@outlook.com>"

ARG DEBIAN_MIRROR=deb.debian.org

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV TZ=Asia/Shanghai

RUN sed -i "s/deb.debian.org/${DEBIAN_MIRROR}/g" /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        locales tzdata ca-certificates openssh-client openssl \
        tar wget git mercurial build-essential python-dev python-pip \
        pandoc \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
