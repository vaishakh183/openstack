#!/bin/bash
string="$1"
file="$2"`
count=0

if [ $# -ne 3 ]
then
echo "Format of Input is ./script.sh string filename"
fi

for  i in  `cat $file`
do

	if [ $i == $string ]
	then
	let count=$count+1
	fi
done

echo "Occuerance of string in this file  is" $count
