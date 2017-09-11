#!/bin/bash
#Auther Vaishakh Vk
LOGFILE='/var/log/secure'

for((j=0;j<=20;j++))
do
grep $(date +%R -d "-$j  min") $LOGFILE >> /tmp/file.txt
while read i
do
echo -e $i "\n"

grep "session" $i 

if [ $? -eq 0  ];then
echo "ROOT login found"
fi
done < /tmp/file.txt


done

> /tmp/file.txt
