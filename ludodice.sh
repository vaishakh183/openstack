#!/bin/bash
echo "Dice is spinning"

random()
{
rad=`echo $RANDOM | cut -c1`
#echo $rad
return $rad
}

random
#echo "retun value is " $?
a=$?
if [[ ($a -gt 0) && ($a -le 6) ]];then
echo $a
else
random
fi
