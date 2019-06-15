#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

export GROUP="$1"
export JULIA_DEBUG="all"
export PREDICTMD_TEST_GROUP="$1"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="true"

echo "GROUP=$GROUP"
echo "JULIA_DEBUG=$JULIA_DEBUG"
echo "PREDICTMD_TEST_GROUP=$PREDICTMD_TEST_GROUP"
echo "PREDICTMD_OPEN_PLOTS_DURING_TESTS=$PREDICTMD_OPEN_PLOTS_DURING_TESTS"

exit 1

julia -e '
    import Pkg;
    Pkg.activate(predictmd);
    Pkg.test("PredictMD");
    Pkg.test("PredictMDExtra");
    Pkg.test("PredictMDFull");
    '

echo "predictmd: runtests.sh: Tests passed."

##### End of file
