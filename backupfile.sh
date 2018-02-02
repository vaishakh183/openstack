#!/bin/bash
for i in `find . -type f  -iname \*.txt`
do
echo $i "is going to backup"
echo $i | awk '{print $1}' | cut -d. -f2 | cut -d/ -f2
cp $i $i.bkp
done
