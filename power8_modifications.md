
These are the modifications we have made for tersoff to execute on the power8. 

Specifically, make sure to copy over `intel_intrinsics_power8.h` and `vector_math_altivec.h` into `$LAMMPS_DIR/src/`
Additionally, make sure to use either IBM xlc or a more recent gcc compiler, i.e. 5/6/7

From there:
```bash
cd $LAMMPS_DIR/src/
make yes-USER-INTEL; make yes-USER-OMP
make power8
```

This will create a binary called lmp_power8 in `LAMMPS_DIR/src`.

For an initial test of the built binary, execute 
```bash
python $TOP_DIR/test/test.py/ $LAMMPS_DIR/src/lmp_power8
```

All the tests _should_ be green. However, for power8, OPT-M is not supported (#1), so for the time being, we expect those tests to fail. 
