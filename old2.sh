#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
yum install wget -y
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
yum install mysql-server -y
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
systemctl start mysqld
chkconfig mysqld on
yum install git -y
yum install php php-mysqlnd php-pdo php-gd php-mbstring php-dom -y
cd /var/www/html
git clone https://github.com/GetDKAN/dkan-drops-7.git
