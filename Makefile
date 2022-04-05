# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/01 10:39:56 by acoezard          #+#    #+#              #
#    Updated: 2022/04/05 23:01:15 by acoezard         ###   ########.fr        #
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
	@docker-compose ${FLAGS} up -d
	@echo ${__GREEN}"ready"${__WHITE}" - docker services are up"${__EOC}

start:
	@docker-compose ${FLAGS} start
	@echo ${__GREEN}"ready"${__WHITE}" - docker services have been started"${__EOC}

stop:
	@docker-compose ${FLAGS} stop
	@echo ${__GREEN}"ready"${__WHITE}" - docker services have been stopped"${__EOC}

clean:
	@rm -rf ./data/
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker data"${__EOC}

fclean: clean
	@docker stop ${shell docker ps -qa}
	@docker rm ${shell docker ps -qa}
	@docker rmi ${shell docker images -qa}
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker container(s)"${__EOC}
#	@docker volume rm ${shell docker volume ls -q}
#	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker volumes(s)"${__EOC}
	@docker network rm ${shell docker network ls --filter type=custom -q}
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker network(s)"${__EOC}

re: fclean all

.PHONY: all fclean clean re
