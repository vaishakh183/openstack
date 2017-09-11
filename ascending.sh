#!/bin/bash
i=1
printf "Total Input \n"
read  no
while [ $i -le $no  ];do
read input
arr[$i]=$input
let i=$i+1
done

echo -e "\n Given numbers are \n"
for((b=1;b<=$no;b++))
do
echo ${arr[$b]}
done

for ((j=1;j<=$no;j++));do
	for ((k=1;k<=$no;k++));do
	 if [ ${arr[$j]} -lt ${arr[$k]}  ];then
	 t=${arr[$j]}
	 arr[$j]=${arr[$k]}
	 arr[$k]=$t
	 fi	
	done
done
echo -e "\n Numbera in Ascending Order \n"
for((a=1;a<=$no;a++))
do
echo ${arr[$a]}
done
