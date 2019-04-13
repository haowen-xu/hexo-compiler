FROM node:latest
LABEL maintainer="Haowen Xu <haowen-xu@outlook.com>"

ARG DEBIAN_MIRROR=deb.debian.org
ARG PANDOC_DEB=https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV TZ=Asia/Shanghai

RUN sed -i "s/deb.debian.org/${DEBIAN_MIRROR}/g" /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        locales tzdata ca-certificates openssh-client openssl apt-transport-https \
        tar wget git mercurial build-essential python-dev python-pip \
    && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN wget -O /tmp/pandoc.deb "${PANDOC_DEB}" && \
    dpkg -i /tmp/pandoc.deb && \
    rm /tmp/pandoc.deb

RUN npm install -g hexo-cli 

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
