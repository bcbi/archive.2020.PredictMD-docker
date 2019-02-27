DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd-stable

##############################################################################

.PHONY: default build push login test test-all testall

default: build

build:
	# $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .
	true

login:
	$(DOCKERCMD) login

push: build
	# $(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)
	true

test: build
	#cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	#$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash -c "/bin/runtests.sh;"
	true

test-all: build
	#cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test .
	#$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)-test /bin/bash -c "/bin/runtests.sh; /bin/runtests-all.sh;"
	true

testall:
	@echo "I think you meant: make test-all"

##############################################################################
