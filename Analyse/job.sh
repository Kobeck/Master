#!/bin/bash
# Name of the job
#$-N matanalyse_lang
#$-q scc 
#$-m eba
#$-l h_vmem=10G
#$-pe smp 16
#$-M konstantin.beck@uni.kn

module load matlab

matlab -batch main


