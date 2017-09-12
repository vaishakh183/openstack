#!/bin/bash
#Auther Vaishakh VK
#This script is to remind you to start TVC
PING='ping -c 3 w3.ibm.com'
notify='/usr/bin/notify-send'
title="IMPORTANT"
if [ ! -f /tmp/count.txt ];then
echo 0 > /tmp/count.txt
fi
count=`cat /tmp/count.txt`
notifybox()
{
	if [ ! -x /usr/bin/notify-send ];then
	echo -e "Install libnotify package. \n Use yum install libnotify"
	fi
$notify $title 'Did you start TVC today ?'
}

$PING
if [ $? -eq 0 ];then
ps auxf | grep -i "/opt/TVC/TvC" | grep -i "/opt/TVC/jre/bin/java"
exitstat=$?
if [ $exitstat -ne 0 ] || [ `cat /tmp/count.txt` -le 1 ]  ;then
notifybox
let count=$count+1
echo $count > /tmp/count.txt 2> /dev/null
fi
if [ $exitstat -ne 0 ] && [ $count -gt 3 ]  ;then
	if [ ! -x /usr/bin/zenity ];then
	echo "Install zenity package. \n Use yum install zenity"
	fi
let count=$count+1
echo $count > /tmp/count.txt 2> /dev/null
zenity --warning --text="You have not started TVC yet. Start it immediately."
if [ $count -gt 3 ];then
zenity --info  --text="Starting TVC automatically...."
/opt/TVC/TvC &
/usr/bin/sametime80 &
> /tmp/count.txt
fi
fi
fi
