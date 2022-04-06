# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 16:47:18 by acoezard          #+#    #+#              #
#    Updated: 2022/04/06 17:06:47 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.14

RUN		apk update
RUN		apk upgrade

#==== MARIADB = INSTALLATION ==================================================#
RUN		apk add mariadb
RUN		apk add mariadb-common
RUN		apk add mariadb-client
RUN		apk add mariadb-server-utils

RUN		/etc/init.d/mariadb setup

#==== OPENRC ==================================================================#
RUN		apk add openrc
RUN		rc-update add mariadb default

#==== MARIADB = CONFIGURATION =================================================#

RUN		/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
RUN		/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

# CREER LES TABLES ET USERS

RUN		pkill mysqld
RUN		/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

#==============================================================================#
EXPOSE	3306

