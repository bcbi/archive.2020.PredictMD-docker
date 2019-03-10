DOCKERCMD = docker

##############################################################################

default: build

.PHONY: default build login push test testall test-all docker-purge-all

docker-purge-all:
	echo "1" | ./utils/docker-purge-all.sh

build:
	$(MAKE) -C tex/latex-for-plotting build
	$(MAKE) -C predictmd/offlineregistry build
	$(MAKE) -C predictmd/predictmd build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C tex/latex-for-plotting push
	$(MAKE) -C predictmd/offlineregistry push
	$(MAKE) -C predictmd/predictmd push

test:
	$(MAKE) -C tex/latex-for-plotting test
	$(MAKE) -C predictmd/offlineregistry test
	$(MAKE) -C predictmd/predictmd test

test-all:
	$(MAKE) -C tex/latex-for-plotting test-all
	$(MAKE) -C predictmd/offlineregistry test-all
	$(MAKE) -C predictmd/predictmd test-all

testall:
	@echo "I think you meant: make test-all"

testbash:
	@echo "I think you meant: make test-bash"

##############################################################################
