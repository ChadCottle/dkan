#!/bin/bash
yum update -y
yum install httpd -y
yum install mysql-server mysql -y
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
chkconfig mysqld on
service mysqld start
yum install git -y
yum install php php-mysqlnd php-pdo php-gd php-mbstring php-dom -y
cd /var/www/html
git clone https://github.com/GetDKAN/dkan-drops-7.git
echo “<? \n phpinfo(); \n phpinfo(INFO_MODULES); \n ?>” >> /var/www/html/phpinfo.php
