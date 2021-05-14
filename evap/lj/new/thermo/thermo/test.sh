#!/bin/bash

SGE_TASK_ID=1
date=$(date +%d_%m-%H%M)                                                                                                                 \

echo $SGE_TASK_ID
temp=$(bc <<< "0.8+$SGE_TASK_ID*0.2")

echo temp = $temp 
dir=32_${temp}_${date}
echo $dir



