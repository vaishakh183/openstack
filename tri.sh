#!/bin/bash
for((i=1;i<=5;i++))
do
for((k=1;k<=(5-i);k++))
do
echo -e " \c "
done
for((j=1;j<=i;j++))
do
echo -e " $j \c"
done
echo -e "\n"
done
