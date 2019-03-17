FROM dilumaluthge/latex-for-plotting:latest
MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

RUN rm -rf /opt/julia/share/julia/compiled/*
RUN rm -rf /opt/julia/share/julia/registries/*
RUN rm -rf /opt/julia/etc/julia/startup.jl

RUN mkdir -p /opt/bcbi/predictmd
RUN cd /opt/bcbi/predictmd && \
    git clone https://github.com/DilumAluthge/OfflineRegistry
RUN cd /opt/bcbi/predictmd/OfflineRegistry && \
    julia -e 'ENV["JULIA_DEBUG"]="all"; include("make.jl");'
