#!/bin/bash

set -ev

make clean
make build
make test-all
make PREFIX=~/local install

set +v

echo "install.sh: completed successfully"
