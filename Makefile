DOCKERCMD = docker

##############################################################################

default: build

.PHONY: default build login push test testall test-all docker-purge-all

docker-purge-all:
	echo "1" | ./utils/docker-purge-all.sh

build:
	$(MAKE) -C tex/latex-for-plotting build
	$(MAKE) -C predictmd/predictmd-stable build
	$(MAKE) -C predictmd/predictmd-unstable build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C tex/latex-for-plotting push
	$(MAKE) -C predictmd/predictmd-stable push
	$(MAKE) -C predictmd/predictmd-unstable push

test:
	$(MAKE) -C tex/latex-for-plotting test
	$(MAKE) -C predictmd/predictmd-stable test
	$(MAKE) -C predictmd/predictmd-unstable test

testall:
	@echo "I think you meant: make test-all"

test-all:
	$(MAKE) -C tex/latex-for-plotting test-all
	$(MAKE) -C predictmd/predictmd-stable test-all
	$(MAKE) -C predictmd/predictmd-unstable test-all

##############################################################################
