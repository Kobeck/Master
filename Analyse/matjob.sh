#!/bin/bash
# Name of the job
#$-N matfs
#$-q scc
#$-M konstantin.beck@uni.kn
#$-m eba
#$-t 4-12
#$-pe smp 4
#$-l h_vmem=10G

P=\'../fsstudie/long/$SGE_TASK_ID\'
S=\'../order/\'
module load matlab
matlab -batch "main($P,$S,$SGE_TASK_ID,26)"

