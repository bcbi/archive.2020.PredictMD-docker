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
pwd


julia make.jl build $IMAGE $IMAGE_NAME_PREFIX"
julia make.jl test $IMAGE $IMAGE_NAME_PREFIX"


if [[ "$TRAVIS_PULL_REQUEST" == "false" ]]
then
    if [[ "$TRAVIS_BRANCH" == "master" ]]
    then
        echo "$DOCKER_BOT_PASSWORD" | docker login -u "$DOCKER_BOT_USERNAME" --password-stdin
        julia make.jl push $IMAGE $IMAGE_NAME_PREFIX"
    else
        if [[ "$TRAVIS_BRANCH" == "staging" ]]
        then
            echo "$DOCKER_BOT_PASSWORD" | docker login -u "$DOCKER_BOT_USERNAME" --password-stdin
            julia make.jl push $IMAGE $IMAGE_NAME_PREFIX"
        else
            if [[ "$TRAVIS_BRANCH" == "trying" ]]
            then
                echo "$DOCKER_BOT_PASSWORD" | docker login -u "$DOCKER_BOT_USERNAME" --password-stdin
                julia make.jl push $IMAGE $IMAGE_NAME_PREFIX"
            else
                :
            fi
        fi
    fi
else
    :
fi

pwd
cd $TRAVIS_BUILD_DIR
pwd
