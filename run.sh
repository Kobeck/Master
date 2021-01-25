#!/bin/bash
rm image*
rm dump*
rm log*
rm out*
mpirun -np 4 ../lmp_mpi -echo screen -in in.cubes  
