# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: grannou <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/25 13:34:49 by grannou           #+#    #+#              #
#    Updated: 2021/08/10 07:48:35 by grannou          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color codes
RED=$'\x1B[31m
GREEN=$'\x1B[32m
YELLOW=$'\x1B[33m
BLUE=$'\x1B[34m
PURPLE=$'\x1B[35m
CYAN=$'\x1B[36m
RESET=$'\x1B[0m
FOX=$'U0001F98A

# Compilation
CC = gcc
CFLAGS = -Wall -Wextra -Werror
NORME = norminette .
RM = rm -rf
HEADER = minitalk.h

# SERVER
SERVER_NAME = server
SERVER_MAIN = server.c
SERVER_SRCS = server.c minitalk_utils.c
SERVER_OBJS = $(SERVER_SRCS:.c=.o)

# CLIENT
CLIENT_NAME = client
CLIENT_MAIN = client.c
CLIENT_SRCS = client.c minitalk_utils.c
CLIENT_OBJS = $(CLIENT_SRCS:.c=.o)

%.0: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SERVER_NAME): $(SERVER_OBJS) $(CLIENT_OBJS)

	@echo "\n"
	@echo "$(RED)███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗$(RESET)"
	@echo "$(YELLOW)██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗$(RESET)"
	@echo "$(GREEN)███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝$(RESET)"
	@echo "$(CYAN)╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗$(RESET)"
	@echo "$(BLUE)███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║$(RESET)"
	@echo "$(PURPLE)╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝$(RESET)"
	@echo "\n"


	$(CC) $(CFLAGS) $(SERVER_OBJS) -o $(SERVER_NAME) -I $(HEADER)
#	ar rc $(SERVER) $(SERVER_OBJS)

	@echo "\n"
	@echo "$(RED) ██████╗██╗     ██╗███████╗███╗   ██╗████████╗$(RESET)"
	@echo "$(YELLOW)██╔════╝██║     ██║██╔════╝████╗  ██║╚══██╔══╝$(RESET)"
	@echo "$(GREEN)██║     ██║     ██║█████╗  ██╔██╗ ██║   ██║$(RESET)"
	@echo "$(CYAN)██║     ██║     ██║██╔══╝  ██║╚██╗██║   ██║$(RESET)"
	@echo "$(BLUE)╚██████╗███████╗██║███████╗██║ ╚████║   ██║$(RESET)"
	@echo "$(PURPLE) ╚═════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝$(RESET)"
	@echo "\n"

	$(CC) $(CFLAGS) $(CLIENT_OBJS) -o $(CLIENT_NAME) -I $(HEADER)
#	ar rc $(CLIENT) $(CLIENT_OBJS)

all: $(SERVER_NAME)

bonus: all

norme:

	@echo "\n"
	@echo "$(RED)███╗   ██╗ ██████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗███████╗████████╗████████╗███████╗$(RESET)"
	@echo "$(YELLOW)████╗  ██║██╔═══██╗██╔══██╗████╗ ████║██║████╗  ██║██╔════╝╚══██╔══╝╚══██╔══╝██╔════╝$(RESET)"
	@echo "$(GREEN)██╔██╗ ██║██║   ██║██████╔╝██╔████╔██║██║██╔██╗ ██║█████╗     ██║      ██║   █████╗$(RESET)"
	@echo "$(CYAN)██║╚██╗██║██║   ██║██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══╝     ██║      ██║   ██╔══$(RESET)"
	@echo "$(BLUE)██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║██║ ╚████║███████╗   ██║      ██║   ███████╗$(RESET)"
	@echo "$(PURPLE)╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚═╝   ╚══════╝$(RESET)"
	@echo "\n"
	@$(NORME)

clean:

	@echo "\n"
	@echo "$(GREEN) ██████╗██╗     ███████╗ █████╗ ███╗   ██╗$(RESET)"
	@echo "$(GREEN)██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║$(RESET)"
	@echo "$(GREEN)██║     ██║     █████╗  ███████║██╔██╗ ██║$(RESET)"
	@echo "$(GREEN)██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║$(RESET)"
	@echo "$(GREEN)╚██████╗███████╗███████╗██║  ██║██║ ╚████║$(RESET)"
	@echo "$(GREEN) ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝$(RESET)"
	@echo "\n"

	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)

fclean: clean

	@echo "\n"
	@echo "$(GREEN)███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗$(RESET)"
	@echo "$(GREEN)██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║$(RESET)"
	@echo "$(GREEN)█████╗  ██║     ██║     █████╗  ███████║██╔██╗ ██║$(RESET)"
	@echo "$(GREEN)██╔══╝  ██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║$(RESET)"
	@echo "$(GREEN)██║     ╚██████╗███████╗███████╗██║  ██║██║ ╚████║$(RESET)"
	@echo "$(GREEN)╚═╝      ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝$(RESET)"
	@echo "\n"


	$(RM) $(SERVER_NAME) $(CLIENT_NAME)

re: fclean all

fox:

	@echo "\n"
	@echo "            ▒▒▒▒                                                  ▒▒▒▒"
	@echo "            ▓▓▓▓▓▓▒▒▒▒                                    ▓▓▓▓▓▓▓▓▓▓▓▓"
	@echo "            ██▓▓▓▓▓▓▓▓████                            ████▓▓▓▓▓▓▓▓▓▓██"
	@echo "            ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓                        ▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▒▒"
	@echo "            ██▓▓▓▓▒▒██▓▓▓▓▓▓████    ████████      ██▓▓▓▓▓▓▓▓████▒▒██▓▓▓▓"
	@echo "            ██▓▓▓▓▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░▓▓▓▓▓▓░░░░▓▓▓▓██▒▒▒▒▒▒██▓▓▓▓"
	@echo "            ██▓▓▓▓▒▒▒▒▒▒████░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒▒▒▒▒▒██▓▓▓▓▓▓"
	@echo "            ██▓▓▓▓▒▒▒▒▒▒▓▓██░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▒▒▒▒▒▒██▓▓██░░"
	@echo "            ██▓▓▓▓▒▒▒▒▒▒▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒▒▒▒▒▒██▓▓██"
	@echo "            ██▓▓▓▓▓▓▒▒▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒▒██░░░░██"
	@echo "              ██░░████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░██"
	@echo "              ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░      ▓▓▒▒"
	@echo "              ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓          ██  ▒▒"
	@echo "                ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓        ██    ▓▓"
	@echo "                ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓        ██    ░░▒▒"
	@echo "                ▓▓░░░░░░██████░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░▓▓        ██        ▓▓"
	@echo "                ██░░░░░░██████░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░██      ██          ▓▓"
	@echo "                ▓▓░░░░░░████ @░░░░░░░░░░░░░░░░░░████@ ░░░░░░░░░░░░░░▓▓      ██          ▓▓"
	@echo "              ▒▒░░░░░░░░████▓▓░░░░░░░░░░░░░░░░░░████▓▓░░░░░░░░░░░░░░░░▓▓    ██            ▓▓"
	@echo "              ▓▓░░░░░░░░████░░░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░██    ██            ██"
	@echo "            ▓▓░░░░░░░░░░░░░░        ██▓▓      ░░░░░░░░░░░░░░░░░░░░░░░░██    ██              ██"
	@echo "            ▓▓░░░░░░░░░░             ░░           ░░░░░░░░░░░░░░░░░░▓▓░░  ▓▓░░              ██"
	@echo "              ▓▓░░░░                                        ░░░░░░▓▓██  ▓▓░░                  ▓▓"
	@echo "                ▓▓                ██    ██                    ░░██      ██░░░░                ██"
	@echo "                ░░▒▒              ░░▓▓▒▒░░                  ▓▓▓▓░░    ▓▓▒▒░░░░                ██"
	@echo "                    ▓▓                                  ▓▓▓▓        ▓▓░░░░░░░░░░░░    ░░  ░░░░██"
	@echo "                      ▒▒▓▓                        ▓▓▓▓▓▓████▓▓▓▓    ██░░░░░░░░░░░░░░░░░░░░░░░░██"
	@echo "                          ██████              ░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░░░░░░░░░██"
	@echo "                            ░░██            ░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░░░░░░░░░░░░░░░░░██"
	@echo "                              ██            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░▒▒██"
	@echo "                              ██            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░▓▓"
	@echo "                              ██░░          ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░▓▓"
	@echo "                              ██░░            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░░░░░░░▓▓"
	@echo "                              ██░░              ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░░░▓▓"
	@echo "                              ▓▓░░░░            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░▓▓▒▒░░"
	@echo "                              ▓▓░░░░░░          ░░░░░░░░░░░░░░      ░░░░░░░░░░▓▓▓▓▓▓"
	@echo "                            ██░░░░░░░░          ░░░░░░░░░░░░▓▓        ░░░░░░░░▓▓"
	@echo "                            ▓▓░░░░░░░░░░██      ░░░░░░░░░░░░▓▓      ░░░░░░░░░░▓▓"
	@echo "                            ▓▓░░▓▓▓▓░░░░░░██████░░░░░░▓▓░░░░████████░░░░░░░░░░▓▓"
	@echo "                            ▓▓▒▒▓▓▓▓▒▒░░▓▓    ██▒▒░░▓▓▓▓▒▒░░▓▓░░░░██░░▒▒▒▒▒▒░░▓▓"
	@echo "                          ▓▓▓▓▓▓▓▓▓▓▓▓▓▓██      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓██"
	@echo "                          ██▓▓▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██▓▓▓▓▓▓▓▓▓▓██"
	@echo "                          ██▓▓▓▓▓▓▓▓▓▓▓▓        ██▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██▓▓▓▓▓▓▓▓▓▓░░"
	@echo "                          ██▓▓▓▓▓▓▓▓▓▓▓▓        ██▓▓▓▓▓▓▓▓▓▓████  ██▓▓▓▓▓▓▓▓██"
	@echo "                            ██████████            ██████████        ████████"
	@echo "                                    ░░                    ░░              ░░"
	@echo "\n"





.PHONY: all bonus norme clean fclean re fox
