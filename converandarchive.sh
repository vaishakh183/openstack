#!/bin/bash
for i in `ls *.sh`
do
j=`basename $i .sh` 
echo Converting "$J"  to txt file
cp $i $j.txt
tar --append --file=txtfilearchive.tar $j.txt
rm -f $j.txt
echo "Files archived"
done
