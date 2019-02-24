DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = julia1.1

.PHONY: default

default: build

##############################################################################

.PHONY: build push login test test-all testall

build:
	$(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

login:
	$(DOCKERCMD) login

push: build
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)

test: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "/opt/predictmd/docker/bin/runtests.sh"

test-all: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "/opt/predictmd/docker/bin/runtests-all.sh"

testall:
	@echo "I think you meant: make test-all"

##############################################################################
