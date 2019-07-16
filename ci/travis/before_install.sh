#!/bin/bash

set -ev

export JULIA_URL="https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1-latest-linux-x86_64.tar.gz"
cd $HOME
export CURL_USER_AGENT="Travis-CI $(curl --version | head -n 1)"
mkdir -p ~/julia
curl -A "$CURL_USER_AGENT" -s -L --retry 7 "$JULIA_URL" | tar -C ~/julia -x -z --strip-components=1 -f -

export PATH="${PATH}:${TRAVIS_HOME}/julia/bin"

julia --color=yes -e "VERSION >= v\"0.7.0-DEV.3630\" && import InteractiveUtils; InteractiveUtils.versioninfo()"
