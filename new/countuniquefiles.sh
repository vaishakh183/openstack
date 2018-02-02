#!/bin/bash
#to find number of same files 
no=0
count=0
file=0
for i in `find . -type f | awk -F/ '{print $NF}'`
do
a[$no]=$i
#echo  ${a[$no]}

	for j in `find . -type f | awk -F/ '{print $NF}'` 
	do
	if [ "${a[$no]}" == "$j" ] 
	then
        let file=$file+1	
	fi	
#	let count=$count+1	

	done
    echo -e "${a[$no]}" count is $file
  	file=0

let no=$no+1
done

