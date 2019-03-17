DOCKERCMD = docker

##############################################################################

default: build

.PHONY: default build login push test testall test-all docker-purge-all

docker-purge-all:
	echo "1" | ./utils/docker-purge-all.sh

build:
	$(MAKE) -C images/latex-for-plotting build
	$(MAKE) -C images/offlineregistry build
	$(MAKE) -C images/predictmd build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C images/latex-for-plotting push
	$(MAKE) -C images/offlineregistry push
	$(MAKE) -C images/predictmd push

test:
	$(MAKE) -C images/latex-for-plotting test
	$(MAKE) -C images/offlineregistry test
	$(MAKE) -C images/predictmd test

test-all:
	$(MAKE) -C images/latex-for-plotting test-all
	$(MAKE) -C images/offlineregistry test-all
	$(MAKE) -C images/predictmd test-all

test-bash:
	$(MAKE) -C images/latex-for-plotting test-bash
	$(MAKE) -C images/offlineregistry test-bash
	$(MAKE) -C images/predictmd test-bash

testall:
	@echo "I think you meant: make test-all"

testbash:
	@echo "I think you meant: make test-bash"

##############################################################################
