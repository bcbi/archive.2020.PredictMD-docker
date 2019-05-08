ifeq ($(DOCKER_IMAGE),)
DOCKER_IMAGE := "dilumaluthge/predictmd"
endif

ifeq ($(PREFIX),)
PREFIX := "/usr/local"
endif

ifeq ($(SINGULARITY_CMD),)
SINGULARITY_CMD := "singularity"
endif

##############################################################################

default: build

.PHONY: default build test install clean

build:
	$(SINGULARITY_CMD) build "predictmd.simg" "docker://$(DOCKER_IMAGE)"

test:
	@echo "I think you meant: make test-all"
	@exit 2

test-all:
	"./predictmd_julia" -e 'ENV["GROUP"]="all"; ENV["JULIA_DEBUG"]="all"; ENV["PREDICTMD_TEST_GROUP"]="all"; ENV["PREDICTMD_OPEN_PLOTS_DURING_TESTS"]="true"; import Pkg; Pkg.activate(predictmd); import PredictMD; import PredictMDExtra; import PredictMDFull;'
	"./predictmd_julia" -e 'ENV["GROUP"]="all"; ENV["JULIA_DEBUG"]="all"; ENV["PREDICTMD_TEST_GROUP"]="all"; ENV["PREDICTMD_OPEN_PLOTS_DURING_TESTS"]="true"; import Pkg; Pkg.activate(predictmd); Pkg.test("PredictMD"); Pkg.test("PredictMDExtra"); Pkg.test("PredictMDFull");'

testall:
	@echo "I think you meant: make test-all"
	@exit 2

install:
	rm -rf "$(PREFIX)/bin/predictmd.simg"
	rm -rf "$(PREFIX)/bin/predictmd_container"
	rm -rf "$(PREFIX)/bin/predictmd_exec"
	rm -rf "$(PREFIX)/bin/predictmd_julia"
	cp "./predictmd.simg" "$(PREFIX)/bin/predictmd.simg"
	cp "./predictmd_container" "$(PREFIX)/bin/predictmd_container"
	cp "./predictmd_exec" "$(PREFIX)/bin/predictmd_exec"
	cp "./predictmd_julia" "$(PREFIX)/bin/predictmd_julia"
	chmod 555 "$(PREFIX)/bin/predictmd.simg"
	chmod 555 "$(PREFIX)/bin/predictmd_container"
	chmod 555 "$(PREFIX)/bin/predictmd_exec"
	chmod 555 "$(PREFIX)/bin/predictmd_julia"

clean:
	rm -rf "predictmd.simg"
	rm -rf "$${HOME}/.singularity"

##############################################################################
