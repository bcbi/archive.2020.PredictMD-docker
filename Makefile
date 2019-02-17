default: build

build:
	$(MAKE) -C tex/latex_for_plotting build
	$(MAKE) -C julia/julia1.1 build
	$(MAKE) -C predictmd/predictmd_unstable build

test:
	$(MAKE) -C tex/latex_for_plotting test
	$(MAKE) -C julia/julia1.1 test
	$(MAKE) -C predictmd/predictmd_unstable test

test-long:
	$(MAKE) -C tex/latex_for_plotting test-long
	$(MAKE) -C julia/julia1.1 test-long
	$(MAKE) -C predictmd/predictmd_unstable test-long

push:
	$(MAKE) -C tex/latex_for_plotting push
	$(MAKE) -C julia/julia1.1 push
	$(MAKE) -C predictmd/predictmd_unstable push
