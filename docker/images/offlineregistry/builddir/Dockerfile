FROM dilumaluthge/latex-for-plotting
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
    julia make.jl "BCBIOfflineRegistry" "226ccab6-caf5-412c-80c4-6c7e3979fa0f" "BCBI Machine Account" "bcbi-git@brown.edu"

RUN find /opt/bcbi -type d -print0 | xargs -0 chmod 755
RUN find /opt/bcbi -type f -print0 | xargs -0 chmod 644
RUN find /opt/julia -type d -print0 | xargs -0 chmod 755
RUN find /opt/julia -type f -print0 | xargs -0 chmod 644
RUN chmod 555 /usr/local/bin/julia
