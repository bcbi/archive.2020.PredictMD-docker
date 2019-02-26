DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = latex-for-plotting

##############################################################################

.PHONY: default build push login test test-all testall

default: build

build:
	cd builddir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

login:
	$(DOCKERCMD) login

push: build
	cd builddir; $(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)

test: build
	true

test-all: build
	true

testall:
	@echo "I think you meant: make test-all"

##############################################################################
