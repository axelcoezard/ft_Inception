#!/bin/sh

curl    -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod   +x wp-cli.phar
mv      -f wp-cli.phar /usr/local/bin/wp

wp      core download --path="/var/www/html"
wp      core config \
        --dbname=${MARIADB_DATABASE} \
        --dbuser=${MARIADB_USER} \
        --dbpass=${MARIADB_PASSWORD} \
        --dbhost=${MARIADB_HOST} \
        --dbprefix=wp_

rm      -f /var/www/html/wp-config.php
cp      conf/default.php /var/www/html/wp-config.php

wp      core install \
        --url=${WORDPRESS_HOST} \
        --admin_user=${MARIADB_ROOT_USER} \
        --admin_password=${MARIADB_ROOT_PASSWORD} \
        --admin_email=${WORDPRESS_ROOT_EMAIL} \
        --path="/var/www/html"
    
exec    php-fpm7 -F

