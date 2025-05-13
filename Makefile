# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: debian <debian@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/28 10:40:03 by carmarqu          #+#    #+#              #
#    Updated: 2025/05/13 05:44:49 by debian           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=inception
DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
DOCKER=docker

all: up

up:
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down 
	
clean: 
	docker system prune -af
	
fclean: down clean
	docker volume prune -f
	
re: fclean all

phony:
	up down clean fclean re all