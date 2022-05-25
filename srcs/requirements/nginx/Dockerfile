# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/06 11:57:53 by acoezard          #+#    #+#              #
#    Updated: 2022/04/08 16:41:02 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.14

RUN		apk update
RUN		apk upgrade

#==== NGINX ===================================================================#
RUN		apk add nginx

RUN		mkdir -p /var/www/html/

COPY	conf/default.conf /etc/nginx/http.d/default.conf

#==== OPENSSL =================================================================#
RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=acoezard/CN=localhost" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.cert

#==== OPENRC ==================================================================#
RUN		apk add openrc
RUN		rc-update add nginx default

#==============================================================================#
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]
