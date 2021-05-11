#!/bin/bash



module load lammps

mpirun -np 4 lmp -in in.rigid
