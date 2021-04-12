#!/bin/bash

rm image.*
rm *.avi
rm log.lammps
rm out

module purge
module load lammps

mpirun -np 1 lmp -in in.mini

