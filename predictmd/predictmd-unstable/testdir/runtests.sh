#!/bin/bash

##### Beginning of file

set -ev

whoami
id -u
id -ru
id -g
id -rg

export GROUP="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

# pushfirst!(DEPOT_PATH, joinpath(homedir(), ".julia"));

julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMD;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDExtra;'
julia -e 'ENV["JULIA_DEBUG"] = "all"; import PredictMDFull;'

echo "predictmd-unstable: runtests.sh: Tests passed."

##### End of file
