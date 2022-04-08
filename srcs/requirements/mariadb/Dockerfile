# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 16:47:18 by acoezard          #+#    #+#              #
#    Updated: 2022/04/08 12:24:36 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.14

RUN			apk update
RUN			apk upgrade

#==== MARIADB = INSTALLATION ==================================================#
RUN			apk add mariadb
RUN			apk add mariadb-common
RUN			apk add mariadb-client
RUN			apk add mariadb-server-utils

RUN			mkdir -p /run/mysqld
RUN			mkdir -p /var/lib/mysql

RUN			rm -f	/etc/mysql/my.cnf \
					/etc/my.cnf \
					~/my.cnf

COPY		conf/default.conf /etc/mysql/my.cnf
COPY		conf/default.conf /etc/my.cnf
COPY		conf/default.conf ~/my.cnf

#==== OPENRC ==================================================================#
RUN			apk add openrc
RUN			rc-update add mariadb default

#==== MARIADB = CONFIGURATION =================================================#
COPY		conf/entrypoint.sh entrypoint.sh
RUN			chmod +x entrypoint.sh
ENTRYPOINT	["./entrypoint.sh"]

#==============================================================================#
EXPOSE		3306

