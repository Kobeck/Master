#!/bin/bash

rm image.*
rm *.avi
rm log.lammps
rm out

mpirun -np 8 lmp -in in.cubes


