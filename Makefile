# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/01 10:39:56 by acoezard          #+#    #+#              #
#    Updated: 2022/04/08 21:23:47 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			:=	inception
VERSION			:=	1.0

# -----------------------------------------------------------------------------
# COMPILATION
# -----------------------------------------------------------------------------
SRCS_DIR		:=	srcs

COMPOSE_FILE	:=	${SRCS_DIR}/docker-compose.yml
ENV_FILE		:=	${SRCS_DIR}/.env

FLAGS			:=	-f ${COMPOSE_FILE} \
					-p ${NAME}

# -----------------------------------------------------------------------------
# COLORS
# -----------------------------------------------------------------------------
__RED			:=	"\033[1;31m"
__GREEN			:=	"\033[1;32m"
__YELLOW		:=	"\033[1;33m"
__BLUE			:=	"\033[1;36m"
__WHITE			:=	"\033[1;37m"
__EOC			:=	"\033[0;0m"

# -----------------------------------------------------------------------------
# RULES
# -----------------------------------------------------------------------------
all: build

build:
	@docker compose ${FLAGS} up -d --build
	@echo ${__GREEN}"ready"${__WHITE}" - docker services are up"${__EOC}

start:
	@docker compose ${FLAGS} start > /dev/null
	@echo ${__GREEN}"ready"${__WHITE}" - docker services have been started"${__EOC}

stop:
	@docker compose ${FLAGS} stop > /dev/null
	@echo ${__RED}"stopped"${__WHITE}" - docker services have been stopped"${__EOC}

status:
	@docker compose ${FLAGS} ps

clean:
	@rm -rf /home/acoezard/data/www/* > /dev/null
	@rm -rf /home/acoezard/data/database/* > /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker data"${__EOC}

fclean: clean
	@docker rmi -f nginx > /dev/null
	@docker rmi -f mariadb > /dev/null
	@docker rmi -f wordpress > /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker images(s)"${__EOC}
	@docker rm -f nginx > /dev/null
	@docker rm -f mariadb > /dev/null
	@docker rm -f wordpress > /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker container(s)"${__EOC}
	@docker volume rm -f inception_database > /dev/null
	@docker volume rm -f inception_www > /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker volumes(s)"${__EOC}
	@docker network rm inception > /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker network(s)"${__EOC}

re: stop fclean all

.PHONY: all start stop status fclean clean re
