#!/bin/bash
#Auther Vaishakh vk
#This script is written to find and remove duplicate files in the file system
file=0
val=0
count=0
comd='ls'
for i in `$comd`
do
arrfile[$file]=$i
let file=$file+1
done
#To see total contents in the array
#echo ${#arrfile[*]}
	for ((j=0;j<$file;j++))
	do
	
		for ((k=0;k<$file;k++))
		do
	
#	if [  ${arrfile[$j]} != ${duplicate[$count]}  ] ;then

#			if [ ${arrfile[$j]} !=   ${arrfile[$k]} ]	;then

			if [ `md5sum  ${arrfile[$j]} | awk '{print $1}'` == `md5sum  ${arrfile[$k]} | awk '{print $1}'` ]
			then
			
				if [ ${arrfile[$j]} != ${arrfile[$k]} ]; then
#			        mv ${arrfile[$k]} /tmp/	
				rm ${arrfile[$k]}
				fi

			fi
#	fi
		
		done
	done
	
