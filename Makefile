DOCKERCMD = docker

##############################################################################

default: build

.PHONY: default build login push test testall test-all docker-purge-all

docker-purge-all:
	echo "1" | ./utils/docker-purge-all.sh

build:
	$(MAKE) -C latex-for-plotting build
	$(MAKE) -C offlineregistry build
	$(MAKE) -C predictmd build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C latex-for-plotting push
	$(MAKE) -C offlineregistry push
	$(MAKE) -C predictmd push

test:
	$(MAKE) -C latex-for-plotting test
	$(MAKE) -C offlineregistry test
	$(MAKE) -C predictmd test

test-all:
	$(MAKE) -C latex-for-plotting test-all
	$(MAKE) -C offlineregistry test-all
	$(MAKE) -C predictmd test-all

testall:
	@echo "I think you meant: make test-all"

testbash:
	@echo "I think you meant: make test-bash"

##############################################################################
