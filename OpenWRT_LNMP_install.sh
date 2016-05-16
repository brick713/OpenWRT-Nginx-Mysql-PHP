#!/bin/sh
# Author Brick

opkg update
echo -e "\033[31m Software Update is Done\033[0m"
opkg install php5 php5-mod-mysql php5-fastcgi php5-cgi \
mysql-server nginx spawn-fcgi zoneinfo-core zoneinfo-asia shadow-groupadd shadow-useradd
echo -e "\033[31m Software install is Done\033[0m"
mkdir /web
groupadd www
useradd -g www www
chown -R www:www /web
echo -e "\033[31m User and WebPath Create Finshed\033[0m"
mv /etc/my.cnf /etc/my.cnf_bak
mv /tmp/my.cnf /etc/
/usr/bin/mysql_install_db --force
/etc/init.d/mysqld start
/usr/bin/mysqladmin -u root password admin
echo -e "\033[31m Mysql install is Done\033[0m"
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_bak
mv /etc/nginx/fastcgi_params /etc/nginx/fastcgi_params_bak
mv /etc/php.ini /etc/php.ini_bak
mv /tmp/nginx.conf /etc/nginx/
mv /tmp/php.ini /etc/
mv /tmp/vhost.conf /etc/nginx/
mv /tmp/fastcgi_params /etc/nginx/
echo -e "\033[31m configer is Done\033[0m"
/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -C 2 -f /usr/bin/php-cgi
/etc/init.d/nginx start
echo "<?php phpinfo(); ?>" > /web/index.php
echo "/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -C 2 -f /usr/bin/php-cgi" >> /etc/rc.local
echo "/etc/init.d/nginx start" >> /etc/rc.local
echo "/etc/init.d/mysqld start" >> /etc/rc.local


