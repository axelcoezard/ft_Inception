#!/bin/sh

sleep 5

curl				-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod				+x wp-cli.phar
mv					-f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp	--info
/usr/local/bin/wp	core download --allow-root --path="/var/www/html"

rm					-f /var/www/html/wp-config.php
cp					./wp-config.php /var/www/html/wp-config.php

/usr/local/bin/wp	core install \
					--allow-root \
					--path="/var/www/html" \
					--url=${WORDPRESS_HOST} \
					--title=${WORDPRESS_TITLE} \
					--admin_user=${WORDPRESS_ADMIN_USER} \
					--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
					--admin_email=${WORDPRESS_ADMIN_EMAIL} \
					--skip-email

/usr/local/bin/wp	user create \
					--allow-root \
					--path="/var/www/html" \
					${WORDPRESS_USER} \
					${WORDPRESS_EMAIL} \
					--role=author \
					--user_pass=${WORDPRESS_PASSWORD}

exec	php-fpm7 -F
