#!/bin/bash
NOW=$(date +%d%m%Y_%H%M%S)
mkdir $NOW
echo "New Directory Named"$NOW

mv -f ./dump* ./$NOW/.
mv -f ./image* ./$NOW/.
mv -f ./log* ./$NOW/.
mv -f ./out* ./$NOW/.
cp -f ./in2.cubes ./$NOW/.
cp -f ./data.cubes ./$NOW/.

echo "moved all data files to new Directory"
