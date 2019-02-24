FROM dilumaluthge/latex_for_plotting:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean

ENV JULIA_DEPOT_PATH=/opt/julia/share/julia

ENV JULIA_VERSION 1.1.0

RUN cd /tmp && \
    wget -q https://julialang.org/juliareleases.asc && \
    gpg --import juliareleases.asc && \
    JULIA_MAJOR_VERSION=$(echo $JULIA_VERSION | cut -c1-3) && \
    JULIA_FILE=$(echo julia-$JULIA_VERSION-linux-x86_64.tar.gz) && \
    JULIA_URL=$(echo https://julialang-s3.julialang.org/bin/linux/x64/$JULIA_MAJOR_VERSION/$JULIA_FILE) && \
    mkdir /opt/julia && \
    cd /tmp && \
    wget -q $JULIA_URL && \
    wget -q $(echo $JULIA_URL.asc) && \
    gpg --verify $JULIA_FILE.asc && \
    tar xzf $JULIA_FILE -C /opt/julia --strip-components=1 && \
    rm /tmp/$JULIA_FILE

RUN ln -fs /opt/julia/bin/julia /usr/local/bin/julia

RUN rm -rf $JULIA_DEPOT_PATH/compiled
RUN julia -e 'import Pkg; Pkg.update();'
RUN rm -rf $JULIA_DEPOT_PATH/compiled

RUN rm -rf /tmp/runtests.sh
COPY runtests.sh /tmp/
RUN mkdir -p /opt/predictmd/docker/bin
RUN touch /opt/predictmd/docker/bin/runtests.sh
RUN cat /tmp/runtests.sh >> /opt/predictmd/docker/bin/runtests.sh
RUN rm -rf /tmp/runtests.sh
RUN chmod 555 /opt/predictmd/docker/bin/runtests.sh

RUN rm -rf /tmp/runtests-all.sh
COPY runtests-all.sh /tmp/
RUN mkdir -p /opt/predictmd/docker/bin
RUN touch /opt/predictmd/docker/bin/runtests-all.sh
RUN cat /tmp/runtests-all.sh >> /opt/predictmd/docker/bin/runtests-all.sh
RUN rm -rf /tmp/runtests-all.sh
RUN chmod 555 /opt/predictmd/docker/bin/runtests-all.sh
