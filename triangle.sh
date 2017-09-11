#!/bin/bash
echo "Enter a number"
read input
q=$input
for ((i=1;i<=$input;i++,g--));do
	for ((j=1;j<=q;j++));do
	echo -e " \c "
	done
	for ((k=1;k<=i;k++))
	do
	echo -e "* \c"
	done
	echo -e "\n"
done

