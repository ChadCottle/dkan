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
cd dkan*
mkdir sites/default/files
chmod 755 sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
chmod 644 sites/default/settings.php
cd /var/www/html
curl -O https://ftp.drupal.org/files/projects/drupal-7.19.tar.gz
tar -xvzf drupal-7*
rm drupal-7.19.tar*
mv drupal-7.19/* drupal-7.19/.htaccess ./
mv drupal-7.19/.gitignore ./
service httpd restart
