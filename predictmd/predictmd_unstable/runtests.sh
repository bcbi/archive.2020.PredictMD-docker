#!/bin/bash

##### Beginning of file

set -ev

export GROUP="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMD;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDExtra;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDFull; PredictMDFull.import_all();'

echo "Tests passed."

##### End of file
