SINGULARITY_CMD = "singularity"
DOCKER_IMAGE = "dilumaluthge/predictmd"
OUTPUT_FILE = "predictmd.simg"

default: build

.PHONY: default build test install clean

build:
	$(SINGULARITY_CMD) build "$(OUTPUT_FILE)" "docker://$(DOCKER_IMAGE)"

test:
	@echo "I think you meant: make test-all"
	@exit 2

test-all:
	./predictmd_julia -e 'ENV["GROUP"]="all"; ENV["JULIA_DEBUG"]="all"; ENV["PREDICTMD_TEST_GROUP"]="all"; ENV["PREDICTMD_OPEN_PLOTS_DURING_TESTS"]="true"; import Pkg; Pkg.activate(predictmd); import PredictMD; import PredictMDExtra; import PredictMDFull;'
	./predictmd_julia -e 'ENV["GROUP"]="all"; ENV["JULIA_DEBUG"]="all"; ENV["PREDICTMD_TEST_GROUP"]="all"; ENV["PREDICTMD_OPEN_PLOTS_DURING_TESTS"]="true"; import Pkg; Pkg.activate(predictmd); Pkg.test("PredictMD"); Pkg.test("PredictMDExtra"); Pkg.test("PredictMDFull");'

testall:
	@echo "I think you meant: make test-all"
	@exit 2

install:
	@echo "install"

clean:
	rm -rf "$(OUTPUT_FILE)"
	rm -rf "$${HOME}/.singularity"

