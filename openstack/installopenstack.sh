#!/bin/bash
#Auther Vaishakh
ret=0
sshkey()
{
echo -e "Enter the compute server IP Address"
read addr
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
ssh-copy-id -i /root/.ssh/id_rsa.pub root@$addr
ssh -o ConnectTimeout=5 $addr  exit
if [ $? -ne 0 ];then
echo -e "Public key authentication is not working to controller server" $addr "Need t ocheck it manually"
else
echo -e "Public key authentication successfully enabled to compute from controller"
return $ret
fi

}

if [ `id -u` -eq  0 ] ;then
echo -e " \n Welcome to installation of Openstack two node cluster \n"
echo -e "This script should run from Controller Node \n"
sshkey  # SSH public key installation
	echo -e "Installing ansible.. \n"
	if  ! rpm -qa | grep -i ansible ;then
	yum install ansible -y
	echo -e "ansible installed \n"
	fi
	sed -i  '1s/^/[openstack]/' /etc/ansible/hosts
	sed -i  "/openstack/a $addr" /etc/ansible/hosts	
	## function call to execute ansible playbook for checking compute server resouce details
	##

#Install openstack repostack reportsitory	
yum install -y  centos-release-openstack-newton
ssh $addr 'yum install -y  centos-release-openstack-newton'
yum install -y python-openstackclient
ssh $addr 'yum install -y python-openstackclient'

#Installing SQL in Controller
yum install -y  mariadb mariadb-server python2-PyMySQL
mysqladmin -uroot password Passw0rd
#enabling access to mysql from controller node
echo -e "[mysqld] \n
bind-address = $addr \n
default-storage-engine = innodb \n
innodb_file_per_table \n
max_connections = 4096 \n
collation-server = utf8_general_ci \n
character-set-server = utf8 \n" > /etc/my.cnf.d/openstack.cnf 
systemctl enable mariadb.service
systemctl start mariadb.service

echo -e " \n \t  Installing RabbitMQ Service \n "
yum install -y rabbitmq-server
systemctl enable rabbitmq-server.service
systemctl start rabbitmq-server.service
echo -e " addning rabbitmq user \n"
rabbitmqctl add_user openstack 123456
echo -e "Permit configuration, write, and read access for the openstack user \n"
rabbitmqctl set_permissions openstack ".*" ".*" ".*"
echo -e "\n Installing Memcached service"
yum install -y memcached python-memcached
systemctl enable memcached.service
systemctl start memcached.service

#call keystone installation script

else
echo "SCRIPT SHOULD RUN AS ROOT USER"
fi
