FROM ubuntu:18.10

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

# Based on https://github.com/brown-ccv/docker-stacks/blob/30dfa8808f072c6af3d56bb45d1fb428fa9c39b1/stronghold/julia/Dockerfile

# Basic OS dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade \
    && apt-get install -yq --no-install-recommends \
    build-essential \
    bzip2 \
    ca-certificates \
    emacs nano vim \
    fonts-liberation \
    gfortran \
    git \
    gpg \
    libgconf-2-4 \
    libgtk2.0-0 \
    libnss3 \
    libssl1.0-dev \
    libxss1 \
    libxtst6 \
    locales \
    openssh-client\
    sudo \
    unzip \
    wget \
    xdg-utils \
    && apt-get clean

RUN apt-get install -y unzip

RUN wget https://github.com/electron/electron/releases/download/v4.0.4/electron-v4.0.4-linux-x64.zip
RUN unzip -q electron-v4.0.4-linux-x64.zip -d atom

# not sure why this is needed but otherwise after installing miniconda we get
#/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
# RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
#     locale-gen

# Configure basic environment
ENV SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    PROMPT_COMMAND="echo -n [$()]"

# Add some other useful tools and dependencies
RUN apt-get install -y \
    cmake \
    gettext \
    hdf5-tools \
    libcurl4-openssl-dev \
    libssl-dev \
    m4 \
    screen \
    && apt-get clean

# ****************************** MySQL **************************************

# Dependencies
RUN apt-get install -yq --no-install-recommends \
    lsb-release gnupg

# Get and configure apt repo for latest version
# see https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install
# if you get an error - check your MYSQL_APT_VERSION at https://dev.mysql.com/downloads/repo/apt/
ENV MYSQL_APT_VERSION 0.8.12-1_all
RUN cd /tmp/ && wget https://dev.mysql.com/get/mysql-apt-config_${MYSQL_APT_VERSION}.deb && \
    dpkg -i mysql-apt-config_${MYSQL_APT_VERSION}.deb

RUN apt-get update && apt-get install -y mysql-client libmysqlclient-dev

# ****************************** Julia GPG key ******************************

# get GPG key and install it to key ring
RUN cd /tmp && \
    mkdir -p /tmp/predictmd-julia && \
    cd /tmp/predictmd-julia && \
    wget -q https://julialang.org/juliareleases.asc && \
    gpg --import juliareleases.asc && \
    cd /tmp && \
    rm -rf /tmp/predictmd-julia

# ****************************** Julia v1.0.4 *******************************

RUN cd /tmp && \
    mkdir -p /opt/julia1.0.4 && \
    mkdir -p /tmp/predictmd-julia && \
    cd /tmp/predictmd-julia && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.4-linux-x86_64.tar.gz && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.4-linux-x86_64.tar.gz.asc && \
    gpg --verify julia-1.0.4-linux-x86_64.tar.gz.asc && \
    tar xzf julia-1.0.4-linux-x86_64.tar.gz -C /opt/julia1.0.4 --strip-components=1 && \
    cd /tmp && \
    rm -rf /tmp/predictmd-julia && \
    /opt/julia1.0.4/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)' && \
    ln -Ffs /opt/julia1.0.4/bin/julia /opt/julia1.0.4/bin/julia1.0.4 && \
    ln -Ffs /opt/julia1.0.4/bin/julia /opt/julia1.0.4/bin/julia1.0 && \
    ln -Ffs /opt/julia1.0.4/bin/julia /usr/local/bin/julia1.0.4 && \
    ln -Ffs /opt/julia1.0.4/bin/julia /usr/local/bin/julia1.0 && \

# ****************************** Julia v1.1.1 *******************************

RUN cd /tmp && \
    mkdir -p /opt/julia1.1.1 && \
    mkdir -p /tmp/predictmd-julia && \
    cd /tmp/predictmd-julia && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.1-linux-x86_64.tar.gz && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.1-linux-x86_64.tar.gz.asc && \
    gpg --verify julia-1.1.1-linux-x86_64.tar.gz.asc && \
    tar xzf julia-1.1.1-linux-x86_64.tar.gz -C /opt/julia1.1.1 --strip-components=1 && \
    cd /tmp && \
    rm -rf /tmp/predictmd-julia && \
    /opt/julia1.1.1/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(verbose=true)' && \
    ln -Ffs /opt/julia1.1.1/bin/julia /opt/julia1.0.4/bin/julia1.1.1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /opt/julia1.0.4/bin/julia1.1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /opt/julia1.0.4/bin/julia1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /opt/julia1.0.4/bin/julia && \
    ln -Ffs /opt/julia1.1.1/bin/julia /usr/local/bin/julia1.1.1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /usr/local/bin/julia1.1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /usr/local/bin/julia1 && \
    ln -Ffs /opt/julia1.1.1/bin/julia /usr/local/bin/julia

RUN mkdir -p /opt/scripts

# Julia MySQL v0.7 ships with an outdated myslq client that prevents us to Connect to servers running on Brown network
# MySQL > v8.04 see - https://github.com/JuliaDatabases/MySQL.jl/issues/118
RUN rm /opt/julia/share/julia/packages/MySQL/owtkt/deps/usr/lib/libmariadb.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so /opt/julia/share/julia/packages/MySQL/owtkt/deps/usr/lib/libmariadb.so
ENV LIBMYSQL_ENABLE_CLEARTEXT_PLUGIN y

RUN rm -rf /opt/julia1.0.4/share/julia/compiled/* && \
    mkdir -p /opt/julia1.0.4/share/julia/compiled

RUN rm -rf /opt/julia1.1.1/share/julia/compiled/* && \
    mkdir -p /opt/julia1.1.1/share/julia/compiled

# expose notebook and mysql port
EXPOSE 8888 3306

COPY entrypoint_scripts_julia_base.sh /opt/scripts/
ENTRYPOINT ["/opt/scripts/julia_base.sh"]
