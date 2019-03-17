DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd

##############################################################################

.PHONY: default build push login test test-all testall

default: build

build:
	cd builddir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

login:
	$(DOCKERCMD) login

push: build
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)

test: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash -c "/bin/runtests.sh"

test-all: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash -c "/bin/runtests.sh && /bin/runtests-all.sh"

test-bash: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash

testall:
	@echo "I think you meant: make test-all"

testbash:
	@echo "I think you meant: make test-bash"

##############################################################################
