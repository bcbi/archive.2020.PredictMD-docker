FROM ubuntu:18.10

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get install -yq --no-install-recommends \
    build-essential \
    bzip2 \
    ca-certificates \
    cmake \
    coreutils \
    emacs  \
    gettext \
    gfortran \
    git \
    gpg \
    gpg-agent \
    libcurl4-openssl-dev \
    libpgf-dev \
    libpgf6 \
    libpgf6-dbg \
    libpng-dev \
    libssl-dev \
    locales \
    nano \
    openssh-client \
    openssl \
    pdf2svg \
    poppler-utils \
    screen \
    sudo \
    texlive-binaries \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-luatex \
    texlive-pictures \
    tmux  \
    vim \
    wget \
    zlib1g-dev
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

RUN rm -rf /opt/predictmd/docker/bin/runtests.sh
RUN mkdir -p /opt/predictmd/docker/bin
COPY runtests.sh  /opt/predictmd/docker/bin/
RUN chmod 555 /opt/predictmd/docker/bin/runtests.sh

RUN rm -rf /opt/predictmd/docker/bin/runtests-all.sh
RUN mkdir -p /opt/predictmd/docker/bin
COPY runtests-all.sh  /opt/predictmd/docker/bin/
RUN chmod 555 /opt/predictmd/docker/bin/runtests-all.sh
