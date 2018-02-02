#!/bin/bash
echo -e "read file \n"

while read line
do
echo $line
done < zombie.c
