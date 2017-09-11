#!/bin/bash
echo -e "Enter password \n"
stty -echo                      #Turn off echoing of typed characters
read pass < /dev/tty            #read passwd
stty echo			#Turn on eching back
