#!/bin/bash
rm image*
rm dump*
rm log.lammps
rm out*
rm movie.avi

mpirun -np 4 ./lmp_mpi -echo screen -in in.cubes


