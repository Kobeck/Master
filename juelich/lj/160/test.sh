date=$(date +%d_%m-%H%M)
startTemp=1.0
SLURM_ARRAY_TASK_ID=1
temp=$(bc <<< "$startTemp+0.1*${SLURM_ARRAY_TASK_ID}")
tempstr=$(bc <<< ${temp}*10/1)
printf -v j "%02d" $tempstr
dir=32_temp05_$j-${date}

