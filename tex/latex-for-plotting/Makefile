DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = latex-for-plotting

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
	$(DOCKERCMD) run -v $(PWD):/dockerdir --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "/dockerdir/runtests.sh"

test-all: build
	$(DOCKERCMD) run -v $(PWD):/dockerdir --network none -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "/dockerdir/runtests-all.sh"

testall:
	@echo "I think you meant: make test-all"

##############################################################################
