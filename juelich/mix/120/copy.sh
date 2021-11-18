#!/bin/bash
for d in ./*;
do
    #cd $d/equi
    echo $d
    for e in $d/equi/*;
    do
	echo $e
	scp beck8@juwels.fz-juelich.de:/data/scc/kobeck/Master/juelich/mix/120/$d/equi/$e/movie* ./$d/equi/$e/.
    done
done
