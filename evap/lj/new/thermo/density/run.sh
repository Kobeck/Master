module purge
module load lammps


startTemp=1
density=1
temp=1


mpirun -n 4 lmp -v startTemp ${startTemp} -v density ${density} -v temp ${temp} -in in.rigid >>out
