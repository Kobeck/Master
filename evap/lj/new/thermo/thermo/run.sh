#!/bin/bash

rm -f image* dump* movie* density*

module load lammps

mpirun -np 4 lmp -v temp 1.0 -in in.rigid
