#!/bin/bash
#This script is intended to create multiple files with random content
#Auther Vaishakh VK
printf "How many files you need to create"
read no
printf "File Name"
read name
for ((i=0;i<=$no;i++ ))
do
echo $RANDOM > $name.$i
done
