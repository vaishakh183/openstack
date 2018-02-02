#!/bin/bash
##Author: Vaishakh
##Email ID: 
##Updated: 13th Nov 2017
##Site: 
HOSTNAME=`hostname`
PATHS="/"
WARNING=90
CRIT=98
CAT=/bin/cat
MAILER=/bin/mail
CRITmailto="YOUREMAIL@DOMAIN.COM"
mailto="YOUREMAIL@DOMAIN.COM"
mkdir -p /var/log/cpuhistory
LOGFILE=/var/log/cpuhistory/hist-`date +%h%d%y`.log
touch $LOGFILE
for path in $PATHS
do
CPU_LOAD=`top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' |awk -F. '{print $1}'`
if [ -n "$WARNING" -a -n "$CRIT" ]; then
if [ "$CPU_LOAD" -ge "$WARNING" -a "$CPU_LOAD" -lt "$CRIT" ]; then
echo " `date "+%F %H:%M:%S"` WARNINGING - $CPU_LOAD on Host $HOSTNAME" >> $LOGFILE
echo "CPU Load is Warning $CPU_LOAD on $HOSTNAME" | $MAILER -s "CPU Load is Warning $CPU_LOAD on $HOSTNAME" $mailto
exit 1
elif [ "$CPU_LOAD" -ge "$CRIT" ]; then
echo "`date "+%F %H:%M:%S"` CRITICAL - $CPU_LOAD on $HOSTNAME" >> $LOGFILE
echo "CPU Load is Critical $CPU_LOAD on $HOSTNAME" | $MAILER -s "CPU Load is Critical $CPU_LOAD on $HOSTNAME" $CRITmailto
exit 2
else
echo "`date "+%F %H:%M:%S"` OK - $CPU_LOAD on $HOSTNAME" >> $LOGFILE
exit 0
fi
fi
done
