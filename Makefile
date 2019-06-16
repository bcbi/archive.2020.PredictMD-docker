DOCKERCMD = docker

##############################################################################

default: build

.PHONY: default build login push test docker-purge-all

docker-purge-all:
	echo "1" | ./docker/utils/docker-purge-all.sh

build:
	$(MAKE) -C docker/images/latex-for-plotting build
	$(MAKE) -C docker/images/offlineregistry build
	$(MAKE) -C docker/images/predictmd build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C docker/images/latex-for-plotting push
	$(MAKE) -C docker/images/offlineregistry push
	$(MAKE) -C docker/images/predictmd push

test:
	$(MAKE) -C docker/images/latex-for-plotting test
	$(MAKE) -C docker/images/offlineregistry test
	$(MAKE) -C docker/images/predictmd test

test-bash:
	@echo "cd into a specific image directory before running make test-bash"
	@exit 2

testbash:
	@echo "I think you meant: make test-bash"
	@exit 2

##############################################################################
