#!/bin/bash

#SBATCH -n 4
#SBATCH -t 0:30:00
#SBATCH --mem=16G

set -ev

make clean
make build
make test-all
make PREFIX=~/local install

set +v

echo "install.oscar.slurm.sh: completed successfully"
