#!/bin/bash -x
#SBATCH --acount=tncscg
#SBATCH --nodes=1
#SBATCH --ntasks=24
#SBATCH --ntasks-per-node=24
#SBATCH --output=lammps-out.%j
#SBATCH --error=lammps-err.%j 
#SBATCH --time=00:20:00

srun --exclusive -n 24 lammps < in.rigid > output.out
