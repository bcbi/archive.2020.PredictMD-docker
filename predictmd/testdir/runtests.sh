#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

export GROUP="import-only"
export JULIA_DEBUG="all"
export PREDICTMD_TEST_GROUP="import-only"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

julia -e '
    import Pkg;
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v", VERSION.major, ".", VERSION.minor, "-PredictMD",),
            )
        );
    import PredictMD;
    import PredictMDExtra;
    import PredictMDFull;
    '

julia -e '
    import Pkg;
    Pkg.activate(
        joinpath(
            homedir(),
            ".julia",
            "environments",
            string("v", VERSION.major, ".", VERSION.minor, "-PredictMD",),
            )
        );
    Pkg.test("PredictMD");
    Pkg.test("PredictMDExtra");
    Pkg.test("PredictMDFull");
    '

echo "predictmd: runtests.sh: Tests passed."

##### End of file
