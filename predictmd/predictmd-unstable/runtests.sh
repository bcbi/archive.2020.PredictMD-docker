#!/bin/bash

##### Beginning of file

set -ev

export GROUP="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMD;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMDExtra;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import Pkg; Pkg.activate("PredictMD-unstable"); import PredictMDFull;'

echo "predictmd-unstable: runtests.sh: Tests passed."

##### End of file
