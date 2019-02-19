DOCKERCMD = docker

default: build

build:
	$(MAKE) -C tex/latex_for_plotting build
	$(MAKE) -C julia/julia1.1 build
	$(MAKE) -C predictmd/predictmd_unstable build

test:
	$(MAKE) -C tex/latex_for_plotting test
	$(MAKE) -C julia/julia1.1 test
	$(MAKE) -C predictmd/predictmd_unstable test

testall:
	@echo "I think you meant: make test-all"

test-all:
	$(MAKE) -C tex/latex_for_plotting test-all
	$(MAKE) -C julia/julia1.1 test-all
	$(MAKE) -C predictmd/predictmd_unstable test-all

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C tex/latex_for_plotting push
	$(MAKE) -C julia/julia1.1 push
	$(MAKE) -C predictmd/predictmd_unstable push
