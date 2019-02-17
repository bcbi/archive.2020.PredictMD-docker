#!/bin/bash

##### Beginning of file

set -ev

julia -e 'import Pkg; Pkg.test("PredictMD");'
julia -e 'import Pkg; Pkg.test("PredictMDExtra");'
julia -e 'import Pkg; Pkg.test("PredictMDFull");'

##### End of file
