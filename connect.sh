#!/bin/bash
#Created by vaishakh vk
#Script is used to login openstack controller and compute servers

status=`sudo virsh list --all | grep controller  | awk '{print $3}'`
status1=`sudo virsh list --all | grep compute  | awk '{print $3}'`
status2=`sudo virsh list --all | grep rh7`	
if [ "$status" != "running" ];then
echo -e "Controller is not running \n starting It"
sudo virsh start controller-KVM
fi

if [ "$status1" != "running" ];then
echo "Compute server is not running"
sudo virsh start compute-KVM
fi


if [ "$status2" != "running" ];then
echo "Controller2 server is not running"
sudo virsh start rh7-clone
fi



if [ $UID = 0  ] || [ $UID = 500 ];then
	
if [ "$status" = "running" ] && [  "$status1" = "running"  ]
then
		
sshcontrol=`ssh -o ConnectTimeout=5 root@192.168.122.200 echo ok 2>&1`
sshcompute=`ssh -o ConnectTimeOut=5 root@192.168.122.31 echo ok 2>&1`


if [ "$sshcontrol" = "ok" ] && [ "$sshcompute" = "ok" ];then 

	gnome-terminal --tab -e 'ssh -o ConnectTimeout=5  root@192.168.122.200' --tab -e 'ssh -o ConnectTimeout=5  root@192.168.122.31' --tab -e 'ssh -o ConnectTimeout=5  root@192.168.122.141'
else

ping -c 2 192.168.122.200 > /dev/null
ser1=$?

ping -c 2 192.168.122.31 > /dev/null
ser2=$?

 if [ $ser1 -eq 0 ] && [ $ser2 -eq 0 ];then
    sudo /etc/init.d/iptables stop > /dev/null
    sleep 5
    gnome-terminal --tab -e 'ssh root@192.168.122.200' --tab -e 'ssh root@192.168.122.141'  --tab -e 'ssh root@192.168.122.31'
    sudo /etc/init.d/iptables start > /dev/null
else
echo "Servers are not pinging . please check the connectivity"
 fi

fi             
	fi
else
    echo "Execute script as user root or vaishakh"
    fi

