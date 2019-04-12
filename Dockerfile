FROM node:latest
LABEL maintainer="Haowen Xu <haowen-xu@outlook.com>"

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV TZ=Asia/Shanghai

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        locales language-pack-en tzdata ca-certificates openssh-client openssl \
        tar wget git mercurial build-essential python-dev python-pip \
        pandoc \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
