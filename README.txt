-Ajenti

install ajenti via :
	curl https://raw.githubusercontent.com/Eugeny/ajenti/master/scripts/install-rhel.sh | sh
OR
	wget http://repo.ajenti.org/ajenti-repo-1.0-1.noarch.rpm 
	rpm -i ajenti-repo-1.0-1.noarch.rpm
	yum install ajenti
Start service:
	service ajenti restart
Opent 8000 port
	iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
Or
	sudo system-config-firewall-tui
Ajenti will be aviable at: 
	https://ip:8000 

-PhpMyAdmin

instal via yum
	sudo yum install phpMyAdmin -y
edit conf file
	sudo nano /etc/httpd/conf.d/phpMyAdmin.conf
	-change all 127.0.0.1 to your ip
For no root password edit file:
	sudo nano /etc/phpmyadmin/config.inc.php
	change to TRUE:
	 $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;
Restart Apache
	sudo service httpd restart
PhpMyAdmin will be aviable at:
	http://ip/phpMyAdmin/