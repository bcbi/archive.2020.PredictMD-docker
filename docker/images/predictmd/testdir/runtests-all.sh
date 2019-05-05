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
export JULIA_DEBUG="all"
export PREDICTMD_TEST_GROUP="all"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

julia -e '
    import Pkg;
    Pkg.activate(predictmd);
    import PredictMD;
    import PredictMDExtra;
    import PredictMDFull;
    '

julia -e '
    import Pkg;
    Pkg.activate(predictmd);
    Pkg.test("PredictMD");
    Pkg.test("PredictMDExtra");
    Pkg.test("PredictMDFull");
    '

echo "predictmd: runtests-all.sh: Tests passed."

##### End of file
