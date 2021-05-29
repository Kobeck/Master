NSLOTS=8
SGE_TASK_ID=1
startTemp=0.8
temp=0.8
gcmctemp=0.8
mu=$(bc <<< "1.5-0.5*${SGE_TASK_ID}")

date=$(date +%d_%m-%H%M)
mustr=$(bc <<< ${mu}*10/1)
printf -v m "%02d" ${mustr}
tempstr=$(bc <<< ${temp}*10/1)
printf -v t "%02d" $tempstr

dir=mu${m}_temp${t}_${date}_${SGE_TASK_ID}

mkdir $dir
cp in.lj restart.dat.1000000 job.sub $dir/.
cd $dir

mpirun -n ${NSLOTS} lmp -echo screen -v mu ${mu} -v gcmctemp ${gcmctemp} -v startTemp ${startTemp} -v temp ${temp} -in in.lj >>out
