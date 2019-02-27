#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

export GROUP="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

mkdir -p $HOME/.julia

julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(Base.DEPOT_PATH, joinpath(homedir(), ".julia"));
    unique!(Base.DEPOT_PATH);
    import Pkg;
    Pkg.test("PredictMD");'

julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(Base.DEPOT_PATH, joinpath(homedir(), ".julia"));
    unique!(Base.DEPOT_PATH);
    import Pkg;
    Pkg.test("PredictMDExtra");'

julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(Base.DEPOT_PATH, joinpath(homedir(), ".julia"));
    unique!(Base.DEPOT_PATH);
    import Pkg;
    Pkg.test("PredictMDFull");'

echo "predictmd-stable: runtests-all.sh: Tests passed."

##### End of file
