FROM node:8.9.1
MAINTAINER David Antaramian <david@timber.io>
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      apt-transport-https \
      curl \
      ca-certificates \
      gnupg2 \
      software-properties-common \
      git \
      make \
      sed \
      openssh-client \
      openssh-server; \
    apt-key add $(curl -fsSL https://download.docker.com/linux/debian/gpg); \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list; \
    apt-get update && apt-get install -y yarn; \
    curl -fsSL https://github.com/timberio/grease/releases/download/v1.0.0/grease-1.0.0-linux-amd64.tar.gz -o /tmp/grease.tar.gz; \
    tar -xzf /tmp/grease.tar.gz -C /tmp; \
    mv /tmp/grease/bin/grease /usr/bin/grease; \
    chown root:root /usr/bin/grease; \
    rm /tmp/grease.tar.gz; \
    rm -r /tmp/grease;

LABEL io.timber.node=8.9.1
