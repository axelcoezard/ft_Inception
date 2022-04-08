#!/bin/sh

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysql -e "CREATE USER \`${MARIADB_USER}\`@\`${MARIADB_HOST}\` IDENTIFIED BY \`${MARIADB_PASSWORD}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@\`${MARIADB_HOST}\`;"
mysql -e "ALTER USER \`${MARIADB_ROOT_USER}\`@\`${MARIADB_HOST}\` IDENTIFIED BY \`${MARIADB_ROOT_PASSWORD}\`;"
mysql -e "FLUSH PRIVILEGES;"

printf "MDP: %s" ${MARIADB_DATABASE}

/usr/bin/mysqld --user=root --datadir=/var/lib/mysqld
