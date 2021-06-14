#!/bin/bash

rm dump*
rm log*
rm image*
rm movie*
rm out


mpirun -n 4 lmp -v startTemp 0.5 -v temp 0.5 -in in.lj
