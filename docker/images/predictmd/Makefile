DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd

ifeq ($(IMAGE_NAME_PREFIX),)
IMAGE_NAME_PREFIX := ""
endif

##############################################################################

.PHONY: default build push login test test-bash testbash

default: build

build:
	cd builddir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)$(DOCKER_IMAGE_NAME) .

login:
	$(DOCKERCMD) login

push: build
	cd builddir; $(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)$(DOCKER_IMAGE_NAME)
	cd testdir; $(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME)

test: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh"

test-bash: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash

testbash:
	@echo "I think you meant: make test-bash"
	@exit 2

##############################################################################
