#!/bin/bash
read -i "Enter number of user" a
#for user in {1..4}
i=0
while [ $i -le $a  ]
do 
#echo -c "creating user $i"
#useradd testuser$i
echo -c "deleting test users"
userdel  testuser$i
let i=$i+1
done
