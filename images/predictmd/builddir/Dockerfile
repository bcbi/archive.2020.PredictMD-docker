FROM dilumaluthge/offlineregistry:latest
MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

RUN mkdir -p /opt/bcbi/predictmd
COPY startup-predictmd.jl /opt/bcbi/predictmd/bin/startup.jl

RUN mkdir -p /opt/julia/etc/julia
COPY startup-system.jl /opt/julia/etc/julia/startup.jl
