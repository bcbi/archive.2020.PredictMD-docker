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
	cd testdir; $(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/test-$(DOCKER_IMAGE_NAME)

test: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh"

test-all: build
	cd testdir && $(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/test-$(DOCKER_IMAGE_NAME) .
	$(DOCKERCMD) run --user predictmdtestuser --network none -it $(DOCKER_IMAGE_OWNER)/test-$(DOCKER_IMAGE_NAME) /bin/bash -c "/bin/runtests.sh && /bin/runtests-all.sh"

testall:
	@echo "I think you meant: make test-all"

##############################################################################
