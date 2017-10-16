#!/bin/bash

module purge
module load compiler/gcc-5.3.0
./build.sh
./lmp_power8 -in ../../benchmarks/lammps/in.tersoff -pk omp 1 -pk balance 0 mode single
