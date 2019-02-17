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

RUN rm -rf /opt/scripts/runtests.sh
RUN mkdir -p /opt/scripts
COPY runtests.sh /opt/scripts/
RUN chmod 555 /opt/scripts/runtests.sh
RUN ln -s /opt/scripts/runtests.sh /bin/runtests.sh
RUN chmod 555 /bin/runtests.sh

RUN rm -rf /opt/scripts/runtests-long.sh
RUN mkdir -p /opt/scripts
COPY runtests-long.sh /opt/scripts/
RUN chmod 555 /opt/scripts/runtests-long.sh
RUN ln -s /opt/scripts/runtests-long.sh /bin/runtests-long.sh
RUN chmod 555 /bin/runtests-long.sh
