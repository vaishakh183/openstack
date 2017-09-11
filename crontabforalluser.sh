#!/bin/bash
for i in `cut -d: -f1 passwd`
do 
crontab -u $i -l
done
