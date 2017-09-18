#!/bin/bash
for i in `ls *`
do
cp $i  /tmp/bkp/$i.bkp
done
