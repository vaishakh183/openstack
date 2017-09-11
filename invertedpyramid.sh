#!/bin/bash
#set -x
echo "Enter a number"
read num
a=$num
for ((i=1;i<=$num;i++,a--));do
	for((j=1;j<=$i;j++));do
	echo -e " \c "
	done
for((k=1;k<=$a;k++));do
echo -e "* \c"
done
echo -e "\n"
done
