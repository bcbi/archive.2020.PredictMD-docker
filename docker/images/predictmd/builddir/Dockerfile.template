FROM dilumaluthge/offlineregistry
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

RUN find /opt/bcbi -type d -print0 | xargs -0 chmod 755
RUN find /opt/bcbi -type f -print0 | xargs -0 chmod 644
RUN find /opt/julia -type d -print0 | xargs -0 chmod 755
RUN find /opt/julia -type f -print0 | xargs -0 chmod 644
RUN chmod 555 /usr/local/bin/julia
