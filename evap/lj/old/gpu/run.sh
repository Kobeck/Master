#!/bin/bash

rm image.*
rm *.avi
rm log.lammps
rm out

mpirun -np 4 lmp -k on g 1 -sf kk -in in.rigid

