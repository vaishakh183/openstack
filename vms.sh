#!/bin/bash
#Auther Vaishakh
#Created to manage VMs
selection ()
{
echo -e "\t \t Select the options \n" "\t \t 1. List all VMs \n" "\t \t 2. List only Running VMs \n" "\t \t 3. Start VM\n" "\t \t 4. Stop VM \n" "\t \t 5. Exit \n"
read opt
}
vmname ()
{
sudo virsh list --all | awk '{print $2}' > /tmp/vmlist
while read vmname
do
if [ "$name" == "$vmname"  ];then
return 1
fi
done < /tmp/vmlist
rm -f /tmp/vmlist > /dev/null
}
echo "Hello" `whoami`
selection
while true
do
case $opt in
	1)       echo -e "\t List Of All VMs  \n"
		 sudo virsh list --all # | awk '{print $1,"  ",$2, " ",$3," ",$4}' 	
		 selection
	;;
	2)       echo -e "\t List of Running VMs \n"
	 	 sudo virsh list # | awk '{print $1," ",$2, " ",$3}' | sed '/^Id/d'
		 selection
	;;
	3)	
		sudo virsh list --all
		echo -e " \t Enter name of the VM :"
		read name
		vmname
                if [ $? = 1 ]; then
		echo -e " \t Provided VM name is " $name " Starting It...."
         	sudo virsh start $name
		selection
                else 
		echo -e " \t Provide Correct VM name "
		exit 0
                fi
	;;
	4)	sudo virsh list --all
		echo -e "\t Enter name of the VM : "
		read namestop
		vmname
		if [ $? = 1 ]; then
		echo -e "\t Provided VM name is " $namestop " Stoping the VM....."
		sudo virsh shutdown $namestop 
		selection
		else
                echo -e " \t Provide Correct VM name "
                exit 0
		fi	
	;;
	5)	 echo -e " \t Exiting "
		exit 0
	;;
	*) 	echo -e "\t Select a proper option \n" "\t Do you want to continue Press 1 or 2 to Exit"
	  	read con
		if [ $con -eq 1 ]
		then
		selection
		else
		exit 0
		fi	
	;;
esac
done
