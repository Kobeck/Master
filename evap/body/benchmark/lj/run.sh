#!/bin/bash

#rm image.*
#rm *.avi
#rm log.lammps
#rm out
NOW=$(date +"%T")

mkdir $NOW
cp in.mini $NOW
cp data* $NOW
cp run.sh $NOW

cd $NOW


module load lammps

mpirun -np 4 lmp -in in.mini

