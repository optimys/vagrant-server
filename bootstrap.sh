#!/usr/bin/env bash

#Updating system
#yum update -y

#Repository for php56
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm 

#Repository EPEL for docker and other staff
#rpm -ivh http://download.fedoraproject.org/pub/epel/6/$(arch)/epel-release-6-8.noarch.rpm

#Fish bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo

#Installing base software
yum install httpd mysql-server php56w php56w-mysql mc nano htop tmux fish docker-io phpMyAdmin -y

#Replace PhpMyAdmin config file
cp /etc/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdminCopy.conf
sed  's/127.0.0.1/0.0.0.0/g' /etc/httpd/conf.d/phpMyAdminCopy.conf > /etc/httpd/conf.d/phpMyAdmin.conf
rm /etc/httpd/conf.d/phpMyAdminCopy.conf
#Installing Ajenti
curl https://raw.githubusercontent.com/Eugeny/ajenti/master/scripts/install-rhel.sh | sh

#Adding current user to docker group
gpasswd -a ${USER} docker

#Open 80 port for Appachi
iptables -I INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT

#Open Port 8000 for Ajenti dashboard
iptables -I INPUT -p tcp --dport 8000 -m state --state NEW -j ACCEPT
service iptables save

#Adding services to start on boot
chkconfig httpd on
chkconfig mysqld on
chkconfig docker on
chkconfig ajenti on

#Sterting servises
service mysqld start
service httpd start 
service docker start 
service ajenti restart
#/usr/bin/mysql_secure_installation #Editing Mysql

#Outputing usefull info
echo "PhpMyAdmin will be aviable at:http://YOR_IP_ADDRES/phpMyAdmin/"
echo ""
echo ""
echo "Ajenti aviable at:https://YOR_IP_ADDRES:8000 with user=root and password=admin"
