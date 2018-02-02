#!/bin/bash
for i in `ls *.txt`
do
if [ -f $i ];then
sed -i s/vaishakh/hi/g $i
cat $i
fi
done
