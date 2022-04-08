# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/08 14:32:52 by acoezard          #+#    #+#              #
#    Updated: 2022/04/08 16:51:07 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN         apk update
RUN         apk upgrade

#==== PHP_FPM =================================================================#
RUN         apk add php7 php7-fpm php7-opcache \
                    curl openrc \
                    php7-mysqli \
                    php7-session \
                    php7-iconv \
                    php7-json \
                    php7-gd \
                    php7-curl \
                    php7-xml \
                    php7-common \
                    php7-imap \
                    php7-cgi \
                    php7-pdo \
                    php7-pdo_mysql \
                    php7-soap \
                    php7-xmlrpc \
                    php7-posix \
                    php7-mcrypt \
                    php7-redis \
                    php7-gettext \
                    php7-ldap \
                    php7-ctype \
                    php7-dom \
                    php7-phar \
                    php7-gd \
                    php7-zlib

#==== WORDPRESS ===============================================================#
COPY		conf/entrypoint.sh entrypoint.sh
RUN			chmod +x entrypoint.sh
ENTRYPOINT	["./entrypoint.sh"]

#==============================================================================#
EXPOSE 9000
