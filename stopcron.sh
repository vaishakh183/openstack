#!/bin/bash
PING='ping -c 3 w3.ibm.com'
$PING 
if [ $? -eq 0 ];then
ps auxf | grep -i "/opt/TVC/TvC" | grep -i "/opt/TVC/jre/bin/java"
exitstat=$?
if [ $exitstat -eq 0 ];then
	sed -i.bkp '/tvcreminder/ s/^/#/' /var/spool/cron/vaishakh
else
sed -i.bkp '/tvcreminder/ s/^#//' /var/spool/cron/vaishakh
fi
fi
