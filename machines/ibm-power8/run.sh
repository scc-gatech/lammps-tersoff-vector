#!/bin/bash

module purge
module load compiler/gcc-5.3.0

# create blank file to indicate no KOKKOS
touch pak.vanilla

# Check if Tersoff parameters are passed
FILE=Si.tersoff
if [ -f $FILE ]; then
   echo "File $FILE exists."
else 
   touch Si.tersoff
   echo "$FILE does not exist. Creating default params"
   default_params="
   Si  Si   Si  3.0 1.0 1.3258 4.8381 2.0417 0.0000 22.956
                0.33675  1.3258  95.373  3.0  0.2  3.2394  3264.7
   "
   echo "$default_params" > Si.tersoff
fi

./lmp_power8 -in in.tersoff -v p vanilla -sf intel -pk omp 0 -pk intel 1 balance 0 mode double
