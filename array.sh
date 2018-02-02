#!/bin/bash
arr=(1 2 3 4 5 8 )
for i in "${arr[@]}"
do
echo $i
done
echo "size" ${#arr[@]}

j=0
while [ $j -le  ${#arr[@]} ]
do
echo -e $j "value " ${arr[$j]}

let j=$j+1
done
