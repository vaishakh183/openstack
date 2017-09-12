#!/bin/sh
#
startcontroller="sudo virsh start controller-KVM"
startcompute="sudo virsh start compute-KVM"

vmstatus () {
if [ "$1" = 0  ];then
echo -e "\t Starting Controller Server... \n"
$startcontroller
fi
if [ "$1" = 1  ];then
echo -e "\t Starting Controller Server... \n"
$startcompute
fi
if [ "$1" = 2  ];then
echo -e "\t Starting Controller Server... \n"
$startcompute
$startcontroller
fi
}

connectivity (){
#ping -c 2 192.168.122.200 > /dev/null
#ping -c 2 192.168.122.31 > /dev/null

}



echo "Checking VMs are running..."
status=`sudo virsh list --all | grep controller  | awk '{print $3}'`
status1=`sudo virsh list --all | grep compute  | awk '{print $3}'`

if  [ "$status" != "running" ] || [ "$status1" != "running"  ]; then

if  [ "$status" != "running" ] && [ "$status1" != "running"  ]; then
echo "Compute and Controller Servers are not running..."
        vmstatus 2
	elif  [ "$status" != "running" ];then
	echo "Controller Server is not running...."
	vmstatus 0
	else 
	echo "Compute Server is not running...."
	vmstatus 1
	fi
fi

