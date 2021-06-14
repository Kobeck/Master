#!/bin/bash

module load lammps

mpirun -np 4 lmp -v temp 1.0 -v startTemp 1.0 -in in.lj
