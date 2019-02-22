FROM dilumaluthge/latex_for_plotting:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

RUN apt-get update && apt-get -yq dist-upgrade \
    && apt-get install -yq --no-install-recommends gpg \
    && apt-get clean
    
# UPDATE THIS TO UPGRADE JULIA VERSION
ENV JULIA_VERSION 1.1.0

# get GPG key and install it to key ring, download and install julia
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

RUN rm -rf /opt/julia/share/julia/compiled
