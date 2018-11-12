#!/usr/bin/env bash

usermod -G www-data vagrant
unlink /etc/php/7.2/fpm/pool.d/php-fpm-pool.conf
cp /vagrant/provision/php-fpm-pool.conf /etc/php/7.2/fpm/pool.d/php-fpm-pool.conf

unlink /etc/nginx/sites-enabled/default
cp /vagrant/provision/nginx-host.conf /etc/nginx/sites-enabled/default

service php7.2-fpm restart
service nginx restart