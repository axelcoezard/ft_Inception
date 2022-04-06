# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/01 10:39:56 by acoezard          #+#    #+#              #
#    Updated: 2022/04/06 15:52:24 by acoezard         ###   ########.fr        #
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
	@docker compose ${FLAGS} up -d
	@echo ${__GREEN}"ready"${__WHITE}" - docker services are up"${__EOC}

start:
	@docker compose ${FLAGS} start &> /dev/null
	@echo ${__GREEN}"ready"${__WHITE}" - docker services have been started"${__EOC}

stop:
	@docker compose ${FLAGS} stop &> /dev/null
	@echo ${__GREEN}"ready"${__WHITE}" - docker services have been stopped"${__EOC}

status:
	@docker compose ${FLAGS} ps

clean:
	@rm -rf ./data/ &> /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker data"${__EOC}

fclean: clean
	@docker stop ${shell docker ps -qa} &> /dev/null
	@docker rm ${shell docker ps -qa} &> /dev/null
	@docker rmi ${shell docker images -qa} &> /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker container(s)"${__EOC}
#	@docker volume rm ${shell docker volume ls -q} &> /dev/null
#	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker volumes(s)"${__EOC}
	@docker network rm ${shell docker network ls --filter type=custom -q} &> /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker network(s)"${__EOC}
	@docker builder prune -af &> /dev/null
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker cache"${__EOC}

re: fclean all

.PHONY: all fclean clean re
