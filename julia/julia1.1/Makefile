DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = julia1.1

.PHONY: default

default: build

##############################################################################

.PHONY: build push login test test-all testall

build:
	$(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

push: build
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)

login:
	$(DOCKERCMD) login

test: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests.sh"

test-all: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests-all.sh"

testall:
	@echo "I think you meant: make test-all"

##############################################################################
