#!/bin/bash

counter=2
while [ $counter -le 10 ]
do
      rm -rf seed_$counter
      #cp cubes/64_temp10_seed${counter}_16_05-1346/data.cubes seed_$counter/.
      ((counter++))
done

echo All done
