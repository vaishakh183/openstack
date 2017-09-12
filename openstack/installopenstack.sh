#!/bin/bash
#Auther Vaishakh

sshkey()
{
echo -e "Enter the compute server IP Address"
read addr
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
ssh-copy-id -i /root/.ssh/id_rsa.pub root@$addr
}
if [ `id -u` -eq  0 ] ;then
echo -e " \n Welcome to installation of Openstack two node cluster \n"
echo -e "This script should run from Controller Node \n"
sshkey  # SSH public key installation
else
echo "SCRIPT SHOULD RUN AS ROOT USER"
fi
