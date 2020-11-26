#!/bin/bash
# Name of the job
#$ -N matanalyse

#$ -q scc 
##$ -l ex
##$ -l ib 

#$ -m eba
#$ -M konstantin.beck@uni.kn

module load matlab

matlab 

main


