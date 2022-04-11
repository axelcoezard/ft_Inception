#!/bin/sh

sleep 5

curl	-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod	+x wp-cli.phar
mv		-f wp-cli.phar /usr/local/bin/wp

wp		core download \
		--allow-root \
		--path="/var/www/html"

#wp		core config \
#		--allow-root \
#		--dbname=${MARIADB_DATABASE} \
#		--dbuser=${MARIADB_ROOT_USER} \
#		--dbpass=${MARIADB_ROOT_PASSWORD} \
#		--dbhost=${MARIADB_HOST} \
#		--dbprefix=${MARIADB_PREFIX}

rm		-f /var/www/html/wp-config.php
cp		default.php /var/www/html/wp-config.php

wp		core install \
		--allow-root \
		--url=${WORDPRESS_HOST} \
		--title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_USER} \
		--admin_password=${WORDPRESS_PASSWORD} \
		--admin_email=${WORDPRESS_EMAIL} \
		--path="/var/www/html"

exec		php-fpm7 -F
