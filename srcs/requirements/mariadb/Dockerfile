# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 16:47:18 by acoezard          #+#    #+#              #
#    Updated: 2022/04/08 22:47:34 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.14

RUN			apk update
RUN			apk upgrade

#==== OPENRC ==================================================================#
RUN			apk add openrc

#==== MARIADB =================================================================#
RUN			apk add mariadb
RUN			apk add mariadb-common
RUN			apk add mariadb-client
RUN			apk add mariadb-server-utils

RUN			rm -f	/etc/mysql/my.cnf \
					/etc/my.cnf \
					~/my.cnf

COPY		conf/default.conf /etc/mysql/my.cnf
COPY		conf/default.conf /etc/my.cnf
COPY		conf/default.conf ~/my.cnf

RUN			mkdir -p /run/mysqld
RUN			mkdir -p /var/lib/mysql

RUN			chown -R mysql /var/lib/mysql
RUN			chmod 777 /var/lib/mysql

COPY		conf/entrypoint.sh entrypoint.sh
RUN			chmod +x entrypoint.sh
ENTRYPOINT	["./entrypoint.sh"]

#==============================================================================#
EXPOSE		3306

