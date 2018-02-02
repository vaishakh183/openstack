#!/bin/bash

for i in `cat ip.txt`
do
echo $i >> load.txt
ssh root@$i w | awk -F" " 'NR==1 {print $8 }'   >> load.txt
done

