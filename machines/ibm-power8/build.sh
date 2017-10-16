#!/usr/bin/bash

set -o verbose
module purge
module load compiler/gcc-5.3.0
module load mpi/openmpi-cuda-2.1

SRC=$PWD

cp -r $SRC/lammps-10Mar16 . 

# copy modified files into lammps folder
cp -r $SRC/../../src/* $SRC/lammps-10Mar16/src/

cd $SRC/lammps-10Mar16/src/
make yes-USER-OMP
make yes-USER-INTEL
make no-KOKKOS
make no-GPU

# remove existing power8 binary
rm -rf lmp_power8

# build power8 binary
make -j10 power8 
cp $SRC/lammps-10Mar16/src/lmp_power8 $SRC/


