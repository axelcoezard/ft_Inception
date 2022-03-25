# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/01 10:39:56 by acoezard          #+#    #+#              #
#    Updated: 2022/03/07 19:20:00 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=	inception
VERSION		:=	1.0

# -----------------------------------------------------------------------------
# COMPILATION
# -----------------------------------------------------------------------------
COMPOSE		:=	docker-compose

# -----------------------------------------------------------------------------
# COLORS
# -----------------------------------------------------------------------------
__RED		:=	"\033[1;31m"
__GREEN		:=	"\033[1;32m"
__YELLOW	:=	"\033[1;33m"
__BLUE		:=	"\033[1;36m"
__WHITE		:=	"\033[1;37m"
__EOC		:=	"\033[0;0m"

# -----------------------------------------------------------------------------
# RULES
# -----------------------------------------------------------------------------
all: clean build

build:
	@cd srcs
	@docker-compose build
	@echo ${__GREEN}"ready"${__WHITE}" - project is running"${__EOC}

clean:
	@${REMOVE} ./data/
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker's data"${__EOC}

fclean: clean
	@docker stop ${docker ps -qa}
	@docker rm ${docker ps -qa}
	@docker rmi ${docker images -qa}
	@docker volume rm ${docker volume ls -q}
	@docker network rm ${docker network ls -q}
	@echo ${__BLUE}"info"${__WHITE}" - cleaned docker container(s)"${__EOC}

re: fclean all

.PHONY: all fclean clean re
