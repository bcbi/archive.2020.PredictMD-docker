FROM dilumaluthge/latex_for_plotting:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

ENV JULIA_DEPOT_PATH=/opt/julia

ENV JULIA_MAJOR=1
ENV JULIA_MINOR=1.1
ENV JULIA_PATCH=1.1.0
ENV JULIA_URL=https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz
ENV JULIA_SHA256=80cfd013e526b5145ec3254920afd89bb459f1db7a2a3f21849125af20c05471
RUN mkdir /opt/julia-${JULIA_PATCH} && \
    cd /tmp && \
    wget -q ${JULIA_URL} && \
    echo "${JULIA_SHA256} *julia-${JULIA_PATCH}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_PATCH}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_PATCH} --strip-components=1 && \
    rm /tmp/julia-${JULIA_PATCH}-linux-x86_64.tar.gz
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia${JULIA_MINOR}
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia${JULIA_PATCH}

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

RUN rm -rf /tmp/runtests-long.sh
COPY runtests-long.sh /tmp/
RUN mkdir -p /opt/scripts
RUN touch /opt/scripts/runtests-long.sh
RUN cat /tmp/runtests-long.sh >> /opt/scripts/runtests-long.sh
RUN rm -rf /tmp/runtests-long.sh
RUN chmod 555 /opt/scripts/runtests-long.sh
RUN ln -fs /opt/scripts/runtests-long.sh /bin/runtests-long.sh
RUN chmod 555 /bin/runtests-long.sh
