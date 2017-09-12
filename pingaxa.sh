#!/bin/bash
#This script is for testing the ping for AXA servers
IPS='/home/vaishakh/scripts/ips.txt'
PING='ping'
for i in `cat $IPS`
do
$PING -c 2  $i 
if [ $? -ne 0 ];then
echo -e "Server" $i is not pinging
fi
done
