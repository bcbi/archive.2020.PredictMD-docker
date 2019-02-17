#!/bin/bash

##### Beginning of file

set -ev

pwd
cd $TRAVIS_BUILD_DIR
pwd
cd $FOLDER
pwd
cd $IMAGE
pwd

docker build -t $DOCKER_IMAGE_OWNER/$IMAGE .

docker run -it $DOCKER_IMAGE_OWNER/$IMAGE /bin/bash -c "runtests.sh"

if [[ "$TRAVIS_BRANCH" == "master" ]]
then
    if [[ "$TRAVIS_PULL_REQUEST" == "false" ]]
    then
        echo "$DOCKER_BOT_PASSWORD" | docker login -u "$DOCKER_BOT_USERNAME" --password-stdin
        docker push $DOCKER_IMAGE_OWNER/$IMAGE
    else
        :
    fi
else
    :
fi

##### End of file
