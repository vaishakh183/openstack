#!/bin/bash
IMGLOC="/home/vaishakh/Downloads/ISO"
no=1
echo -e "Available image files \n"
for i in `ls $IMGLOC` 
do
echo $no  $i
let no=$no+1
done
echo -e "Select an image file to install a vm \n"
read imgname
echo -e "Enter VM name"
read vmname
echo "Default RAM 1024 MB and 1 VCPU \n"
echo "Starting Installation......"
virt-install --connect qemu:///system --name $vmname --ram 1024 --vcpus 1  --os-type=linux --disk path=$IMGLOC/$imgname,device=cdrom   --noautoconsole
