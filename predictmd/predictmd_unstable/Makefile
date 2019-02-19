DOCKERCMD = docker
DOCKER_IMAGE_OWNER = dilumaluthge
DOCKER_IMAGE_NAME = predictmd_unstable

default: build

build:
	$(DOCKERCMD) build -t $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) .

test: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests.sh"

testall:
	@echo "I think you meant: make test-all"

test-all: build
	$(DOCKERCMD) run -it $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME) /bin/bash -c "runtests-all.sh"

login:
	$(DOCKERCMD) login

push: build
	$(DOCKERCMD) push $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME)
