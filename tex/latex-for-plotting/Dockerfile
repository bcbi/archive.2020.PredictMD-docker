# FROM ubuntu:18.10
FROM browndatasci/sh-julia:latest

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
