#!/bin/bash -x

mpirun -np 4 lmp -echo screen -in in.rigid > out
