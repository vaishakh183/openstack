#!/bin/bash
. ./addfunctions.lib

while :
do
echo " Address Book \n  \c 1.Search \c \n 2.Add \c \n 3.Remove \c \n 4.Edit \n 5.Exit \n"
read input
case "$input" in
	"1")
	search
	;;
	"2")
	add
	;;
	"3")
	remove
	;;
	"5")
	break
	;;
esac

done
