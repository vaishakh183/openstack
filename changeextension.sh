#!/bin/bash
for i in `ls *.sh`
do
val=$(echo $i | cut -d. -f1)
echo $val
cp $i $val".txt"
done
