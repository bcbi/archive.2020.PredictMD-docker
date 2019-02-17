DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = julia1.1

default: build

build:
	$(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

test: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests.sh"

test-long: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests-long.sh"

login:
	$(DOCKERCMD) login

push: build login
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)
