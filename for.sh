#!/bin/bash
echo "multiplication table"
read a b

for (( i=0;i<=$b;i++ ))
do
c=$((i * a ))
echo $a "*" $i "=" $c 
done

