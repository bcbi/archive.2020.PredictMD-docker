i#!/bin/bash

##### Beginning of file

set -ev

whoami
id -u
id -ru
id -g
id -rg

latex --version

echo "dilumaluthge/predictmd-stable: runtests.sh: Tests passed."

##### End of file
