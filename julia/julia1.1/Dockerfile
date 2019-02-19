FROM dilumaluthge/latex_for_plotting:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

ENV JULIA_DEPOT_PATH=/opt/julia

ENV _JULIA_MAJOR=1
ENV _JULIA_MAJOR_MINOR=1.1
ENV _JULIA_MAJOR_MINOR_PATCH=1.1.0
ENV _JULIA_URL=https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz
ENV _JULIA_SHA256=80cfd013e526b5145ec3254920afd89bb459f1db7a2a3f21849125af20c05471
RUN mkdir /opt/julia-${_JULIA_MAJOR_MINOR_PATCH} && \
    cd /tmp && \
    wget -q ${_JULIA_URL} && \
    echo "${_JULIA_SHA256} *julia-${_JULIA_MAJOR_MINOR_PATCH}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${_JULIA_MAJOR_MINOR_PATCH}-linux-x86_64.tar.gz -C /opt/julia-${_JULIA_MAJOR_MINOR_PATCH} --strip-components=1 && \
    rm /tmp/julia-${_JULIA_MAJOR_MINOR_PATCH}-linux-x86_64.tar.gz
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia${_JULIA_MAJOR_MINOR}
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia${_JULIA_MAJOR_MINOR_PATCH}

RUN rm -rf $JULIA_DEPOT_PATH/compiled
RUN julia -e 'import Pkg; Pkg.update();'
RUN rm -rf $JULIA_DEPOT_PATH/compiled

RUN rm -rf /tmp/runtests.sh
COPY runtests.sh /tmp/
RUN mkdir -p /opt/scripts
RUN touch /opt/scripts/runtests.sh
RUN cat /tmp/runtests.sh >> /opt/scripts/runtests.sh
RUN rm -rf /tmp/runtests.sh
RUN chmod 555 /opt/scripts/runtests.sh
RUN ln -fs /opt/scripts/runtests.sh /bin/runtests.sh
RUN chmod 555 /bin/runtests.sh

RUN rm -rf /tmp/runtests-all.sh
COPY runtests-all.sh /tmp/
RUN mkdir -p /opt/scripts
RUN touch /opt/scripts/runtests-all.sh
RUN cat /tmp/runtests-all.sh >> /opt/scripts/runtests-all.sh
RUN rm -rf /tmp/runtests-all.sh
RUN chmod 555 /opt/scripts/runtests-all.sh
RUN ln -fs /opt/scripts/runtests-all.sh /bin/runtests-all.sh
RUN chmod 555 /bin/runtests-all.sh
