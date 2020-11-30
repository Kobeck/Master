#!/bin/bash
# Name of the job
#$ -N matanalyse
#$ -q scc 
#$ -m eba
#$ -pe smp 16
#$ -M konstantin.beck@uni.kn

module load matlab

matlab -batch main


