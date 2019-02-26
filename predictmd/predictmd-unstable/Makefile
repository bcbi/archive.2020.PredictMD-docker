DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd-unstable

.PHONY: default

default: build

##############################################################################

.PHONY: build push login test test-all testall

build:
	cd builddir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

login:
	$(DOCKERCMD) login

push: build
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)

test: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	$(DOCKERCMD) run --user predictmdtestuser -v $(PWD)/testdir:/dockerdir --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash -c "/dockerdir/runtests.sh; "

test-all: build
	true

testall:
	@echo "I think you meant: make test-all"

##############################################################################
