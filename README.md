<h3>Installed packages</h3>
<ol>
	<li>Apache</li>
	<li>Mysql</li>
	<li>Php 5.6</li>
	<li>htop</li>
	<li>mc</li>
	<li>tmux</li>
	<li>nano</li>
	<li>Ajenti</li>
	<li>PhpMyAdmin</li>
	<li>fish</li>
	<li>docker</li>
</ol>

<h5>Ajenti</h5>
Ajenti will be available at: 
	<b>https://ip:8000<b>

<h5>PhpMyAdmin</h5>
For no root password edit file:
	sudo nano /etc/phpmyadmin/config.inc.php
	change to TRUE:
	 $cfg['Servers'][$i]['AllowNoPassword'] = <b>TRUE</b>;
Restart Apache
	<i>sudo service httpd restart</i>
PhpMyAdmin will be available at:
	<b>http://ip/phpMyAdmin/<b>