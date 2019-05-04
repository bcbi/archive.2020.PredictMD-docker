DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = offlineregistry

ifeq ($(IMAGE_NAME_PREFIX),)
IMAGE_NAME_PREFIX := ""
endif

##############################################################################

.PHONY: default build push login test test-all testall

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

test-all: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh && /bin/runtests-all.sh"

test-bash: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash

testall:
	@echo "I think you meant: make test-all"
	@exit 2

testbash:
	@echo "I think you meant: make test-bash"
	@exit 2

##############################################################################
