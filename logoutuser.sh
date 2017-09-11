#!/bin/sh
#This script is intended to logout idle user after 30 Min
no=0
count=0
logoutuser()
{
echo "The User" ${arr[$no-2]} "in"  ${arr[$no-1]}  "is idle for"  $a "minute".
killuser
}

killuser()
{
echo -e " Would you like logout USER" ${arr[$no-2]} "?"  "Y or N"
read yn
if [ $yn == "y" ]
then
pkill -9 -t  ${arr[$no-1]}
fi
}

for i in `w -o -h| awk '{print $1,$2,$5}' `
do
arr[$no]=$i

a=$(echo ${arr[$no]} | cut -d: -f1)
if  [[ $a =~ ^[0-9]+$ ]]
    then
logoutuser
fi
let no=$no+1
done
