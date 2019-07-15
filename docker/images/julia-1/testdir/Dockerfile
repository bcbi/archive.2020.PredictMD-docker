FROM dilumaluthge/julia-1

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

COPY runtests.sh /bin/runtests.sh

RUN useradd -ms /bin/bash predictmdtestuser
USER predictmdtestuser
WORKDIR /home/predictmdtestuser
