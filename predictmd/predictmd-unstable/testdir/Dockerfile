FROM dilumaluthge/predictmd-unstable:latest

MAINTAINER Dilum Aluthge <dilum@aluthge.com>

COPY runtests.sh /bin/runtests.sh
COPY runtests-all.sh /bin/runtests-all.sh

RUN useradd -ms /bin/bash predictmdtestuser
USER predictmdtestuser
WORKDIR /home/predictmdtestuser
