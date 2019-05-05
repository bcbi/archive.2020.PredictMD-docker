#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

latex --version

echo "dilumaluthge/latex-for-plotting: runtests-all.sh: Tests passed."

##### End of file
