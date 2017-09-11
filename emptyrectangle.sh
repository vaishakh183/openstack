#!/bin/bash
echo "Length"
read length
echo "Width"
read width
for ((i=1;i<=$width;i++));do
	for((j=1;j<=$length;j++));do
	if [ $i -eq 1 ] || [ $i -eq $width ];then
	printf "* "
	
	elif [ $j -eq 1 ] || [ $j -eq $length ];then
	printf "* "
	fi
	done
	echo -e " \n  "
done
