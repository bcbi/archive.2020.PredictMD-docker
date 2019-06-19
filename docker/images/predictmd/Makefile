DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd

ifeq ($(IMAGE_NAME_PREFIX),)
IMAGE_NAME_PREFIX := ""
endif

ifeq ($(PREDICTMD_TEST_GROUP),)
PREDICTMD_TEST_GROUP := "all"
endif

ifeq ($(PREDICTMD_OPEN_PLOTS_DURING_TESTS),)
PREDICTMD_OPEN_PLOTS_DURING_TESTS := "true"
endif

##############################################################################

.PHONY: default build push login test test-bash testbash
.PHONY: __travis-build-test-image__ __travis-run-test-image__

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
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh $(PREDICTMD_TEST_GROUP) $(PREDICTMD_OPEN_PLOTS_DURING_TESTS)"

__travis-build-test-image__: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .

__travis-run-test-image__:
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh $(PREDICTMD_TEST_GROUP) $(PREDICTMD_OPEN_PLOTS_DURING_TESTS)"

test-bash: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(IMAGE_NAME_PREFIX)test-$(DOCKER_IMAGE_NAME) /bin/bash

testbash:
	@echo "I think you meant: make test-bash"
	@exit 2

##############################################################################
