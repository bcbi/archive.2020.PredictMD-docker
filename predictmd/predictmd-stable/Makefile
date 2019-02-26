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
	true

test-all: build
	true

testall:
	@echo "I think you meant: make test-all"

##############################################################################
