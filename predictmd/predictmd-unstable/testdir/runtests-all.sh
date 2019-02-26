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

julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(DEPOT_PATH,"/opt/julia/share/julia");
    pushfirst!(DEPOT_PATH,joinpath(homedir(),".julia",),);
    import Pkg;
    Pkg.test("PredictMD");
    '
julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(DEPOT_PATH,"/opt/julia/share/julia");
    pushfirst!(DEPOT_PATH,joinpath(homedir(),".julia",),);
    import Pkg;
    Pkg.test("PredictMDExtra");
    '
julia -e '
    ENV["JULIA_DEBUG"] = "all";
    pushfirst!(DEPOT_PATH,"/opt/julia/share/julia");
    pushfirst!(DEPOT_PATH,joinpath(homedir(),".julia",),);
    import Pkg;
    Pkg.test("PredictMDFull");
    '

echo "predictmd-unstable: runtests-all.sh: Tests passed."

##### End of file
