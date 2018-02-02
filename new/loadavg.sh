#!/bin/sh
#
NOTIFY=”1″
TRUE=”1″
EMAIL=”randhir.thakre@gmail.com another user mail id”
TEMPFILE=”$(mktemp)”
FTEXT=’load average:’
LOAD1MIN=”$(uptime | awk -F “$FTEXT” ‘{ print $2 }’ | cut -d, -f1 | sed ‘s/ //g’)”
LOAD5MIN=”$(uptime | awk -F “$FTEXT” ‘{ print $2 }’ | cut -d, -f2 | sed ‘s/ //g’)”
LOAD15MIN=”$(uptime | awk -F “$FTEXT” ‘{ print $2 }’ | cut -d, -f3 | sed ‘s/ //g’)”
MEMU=”$(free -tom | awk ‘/Total:/ {print “Total memory: “$2” MB\nUsed memory: “$3” MB\nFree memory: “$4″ MB”}’)”
SUBJECT=”Alert $(hostname) high load average forName of server $LOAD5MIN”
echo “Server 5 min load average $LOAD5MIN is above notification threshold $NOTIFY” >> $TEMPFILE
echo ” ” >> $TEMPFILE
echo “Hostname: $(hostname)” >> $TEMPFILE
echo “Local Date & Time : $(date)” >> $TEMPFILE
echo ” ” >> $TEMPFILE
echo “Server load for the last five minutes: $LOAD5MIN” >> $TEMPFILE
echo “Server load for the last fifteen minutes: $LOAD15MIN” >> $TEMPFILE
echo ” ” >> $TEMPFILE
echo “————————” >> $TEMPFILE
echo “Memory stats:” >> $TEMPFILE
echo “————————” >> $TEMPFILE
echo “$MEMU” >> $TEMPFILE
echo ” ” >> $TEMPFILE
RESULT=$(echo “$LOAD5MIN > $NOTIFY” | bc)
if [ “$RESULT” == “$TRUE” ]; then
# echo true
/bin/mail -s “$SUBJECT” “$EMAIL” /dev/null 2>&1
