#!/usr/bin/env bash

apt-get install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update

apt-get install --no-install-recommends -y \
    curl wget apt-transport-https lsb-release ca-certificates git openssh-client \
    mysql-client mc htop unzip lsof inetutils-tools inetutils-ping nginx \
    php7.2 php7.2-fpm php7.2-dev php7.2-bcmath php7.2-json php7.2-sqlite3 php7.2-opcache \
    php7.2-curl php7.2-cli php7.2-intl php7.2-xml php7.2-zip php7.2-mysql \
    php7.2-mbstring php7.2-gd php7.2-amqp php7.2-igbinary php7.2-apcu

curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

curl -L https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o php-cs-fixer
chmod a+x php-cs-fixer
mv php-cs-fixer /usr/local/bin/php-cs-fixer