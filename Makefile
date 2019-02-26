DOCKERCMD = docker

.PHONY: default

default: build

##############################################################################

.PHONY: build login push test testall test-all

build:
	$(MAKE) -C tex/latex_for_plotting build
	$(MAKE) -C predictmd/predictmd_unstable build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C tex/latex_for_plotting push
	$(MAKE) -C predictmd/predictmd_unstable push

test:
	$(MAKE) -C tex/latex_for_plotting test
	$(MAKE) -C predictmd/predictmd_unstable test

testall:
	@echo "I think you meant: make test-all"

test-all:
	$(MAKE) -C tex/latex_for_plotting test-all
	$(MAKE) -C predictmd/predictmd_unstable test-all

##############################################################################

.PHONY: docker-purge-all

docker-purge-all:
	echo "1" | ./scripts/docker-purge-all.sh

##############################################################################
