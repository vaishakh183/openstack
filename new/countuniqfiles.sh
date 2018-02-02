
no=0
for i in `ls -Rl /tmp/test | grep -v ^d | awk '{print $9}' | sed '/^$/d' | uniq -u`
do
if [ i[$no] ==   ]
echo $i
fi
done
