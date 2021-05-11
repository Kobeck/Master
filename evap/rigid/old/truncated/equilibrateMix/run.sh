#!/bin/bash

rm image.*
rm *.avi
rm log.lammps
rm out

mpirun -np 4 lmp -in in.solvent


