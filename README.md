# dkan
DKAN deployment


sudo yum update -y
sudo yum install httpd -y
sudo yum install mysql-server mysql
sudo chkconfig mysqld on
sudo service mysqld start
mysqladmin -u root password thisisNOTmydayJOB23

#connect to mysql to see if it works
mysql -u root -p

sudo systemctl stop mysqld
sudo systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
sudo systemctl start mysqld
mysql -u root
pmysql -u root -p


#php install
yum install php php-mysqlnd php-pdo php-gd php-mbstring php-dom
create php.info file in /var/www/htm/phpinfo.php
sudo vi phpinfo.php
<?php 
phpinfo();
?>

#git
sudo yum install git -y
cd /var/www/html
sudo git clone https://github.com/GetDKAN/dkan-drops-7.git

#permissions, etc.
cd dkan*
sudo mkdir sites/default/files
sudo chmod 777 sites/default/files
sudo cp sites/default/default.settings.php sites/default/settings.php
sudo chmod 777 sites/default/settings.php


#Install Drupal
cd /var/www/html
sudo curl -O https://ftp.drupal.org/files/projects/drupal-7.19.tar.gz
tar -xvzf drupal-7*
rm drupal-7.19.tar*
sudo mv drupal-7.19/* drupal-7.19/.htaccess ./
sudo mv drupal-7.19/.gitignore ./
