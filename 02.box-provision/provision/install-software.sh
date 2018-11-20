#!/usr/bin/env bash

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get install --no-install-recommends -y \
    curl wget apt-transport-https lsb-release ca-certificates git openssh-client \
    mysql-client mc htop unzip lsof inetutils-tools inetutils-ping nginx \
    php7.2 php7.2-fpm php7.2-dev php7.2-bcmath php7.2-json php7.2-sqlite3 php7.2-opcache \
    php7.2-curl php7.2-cli php7.2-intl php7.2-xml php7.2-zip php7.2-mysql \
    php7.2-mbstring php7.2-gd php7.2-amqp php7.2-igbinary php7.2-apcu

curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

curl -L https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo apt-get -y install mysql-client
sudo sed -i 's/bind-address/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -proot -e "UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='root';"
mysql -u root -proot -e "FLUSH PRIVILEGES;"
sudo service mysql restart