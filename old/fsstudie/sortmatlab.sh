#!/bin/bash
for i in {4..14}
do
#mv high$i/ordavgt.txt high$i/ordavgt$i.txt
mv high$i/ordmatrix.txt high$i/ordmatrix$i.txt

#cp high$i/ordavgt$i.txt datahigh/.
cp high$i/ordmatrix$i.txt datahigh/.
done
