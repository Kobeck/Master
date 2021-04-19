#!/bin/bash

rm image.*
rm *.avi
rm log.lammps
rm out

mpirun -np 4 lmp -k on -sf kk -in in.rigid

