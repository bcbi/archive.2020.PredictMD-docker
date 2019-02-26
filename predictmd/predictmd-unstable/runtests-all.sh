#!/bin/bash

##### Beginning of file

set -ev

export GROUP="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); Pkg.test("PredictMD");'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable");Pkg.test("PredictMDExtra");'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable");Pkg.test("PredictMDFull");'

echo "predictmd-unstable: runtests-all.sh: Tests passed."

##### End of file
