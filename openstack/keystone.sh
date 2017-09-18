#!/bin/bash

mysql -u root -pPassw0rd -e "CREATE DATABASE keystone"
mysql -u root -pPassw0rd -e "grant all privileges on keystone.* to keystone@'localhost' identified by 123456"
mysql -u root -pPassw0rd -e "grant all privileges on keystone.* to keystone@'%' identified by 123456"
yum install -y openstack-keystone httpd mod_wsgi

