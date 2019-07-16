#!/bin/bash

set -ev

if [[ "$TRAVIS_BRANCH" == "master" ]]
then
    export IMAGE_NAME_PREFIX=""
else
    if [[ "$TRAVIS_BRANCH" == "staging" ]]
    then
        export IMAGE_NAME_PREFIX="staging-"
    else
        if [[ "$TRAVIS_BRANCH" == "trying" ]]
        then
            export IMAGE_NAME_PREFIX="trying-"
        else
            export IMAGE_NAME_PREFIX="TRAVIS-DO-NOT-PUSH-"
        fi
    fi
fi

echo "IMAGE_NAME_PREFIX=$IMAGE_NAME_PREFIX"

pwd
cd $TRAVIS_BUILD_DIR
pwd

pwd
cd docker
julia make.jl test $IMAGE $IMAGE_NAME_PREFIX"

pwd
cd $TRAVIS_BUILD_DIR
pwd
