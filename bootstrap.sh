#!/usr/bin/env bash

#Updating system
#yum update -y

#Repository for php56
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm 

#Repository EPEL for docker and other staff
rpm -ivh http://download.fedoraproject.org/pub/epel/6/$(arch)/epel-release-6-8.noarch.rpm

#Fish bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo

#Installing base software
yum install httpd mysql-server php56w php56w-mysql  mc nano htop tmux fish docker-io -y

#Adding current user to docker group
gpasswd -a ${USER} docker

#Open 80 port
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
service iptables save 

#Adding services to start on boot
chkconfig httpd on
chkconfig mysqld on
chkconfig docker on

#Sterting servises
service mysqld start
service httpd start 
service docker start 

#/usr/bin/mysql_secure_installation
