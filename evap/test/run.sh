#!/bin/bash
NOW=$( date '+%d%m_%H:%M')
#rm image*
#rm dump*
#rm log.lammps
#rm out*
#rm movie.avi
mkdir $NOW
cp data.sphere ./$NOW
cp in.units ./$NOW
cd $NOW 

mpirun -np 4 ../lmp_mpi -echo screen -in in.units


