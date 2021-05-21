#!/bin/bash

module load lammps

mpirun -np 8 lmp -v startTemp 0.5 -v temp 0.8 -in in.lj
