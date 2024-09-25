/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: grannou <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/25 08:22:24 by grannou           #+#    #+#             */
/*   Updated: 2021/08/10 07:48:55 by grannou          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

# include <unistd.h>
# include <signal.h>
# include <stdlib.h>
# include <stdio.h>
# include <term.h>

/*
** Define signal latency according to Operating System
*/
# if defined(__linux__)
#  define OS_LATENCY 2000
# elif defined(__APPLE__)
#  define OS_LATENCY 300
# endif

/*
** Logical AND operation between the first bit of a char (8 bits) AND
** a mask (0x80 hexa==128 binary==10000000 binary) then left shift bit per bit
*/
# define MASK 0x80

/*
** Custom Colors and Emojis
*/
# define RED "\033[1;31m"
# define GREEN "\033[1;32m"
# define YELLOW "\033[1;33m"
# define BLUE "\033[1;34m"
# define PURPLE "\033[1;35m"
# define CYAN "\033[1;36m"
# define RESET "\033[0m"
# define ME "🦊🌸⛩"
# define CRASH "💥"
# define EYES "👀"
# define GRANNOU "🔮🧡🍁🐞🍄🍀🌸🐹🌳🦊🐼🌿🧡🦊🧡🌿🐼🦊🌳🐹🌸🍀🍄🐞🍁🧡🔮"

/*
** SERVER = server.c
*/
void	print_server_pid(int server_pid);
void	handle_signal(int signal, siginfo_t *infos, void *oldact);
void	server_error(void);

/*
** CLIENT = client.c
*/
int		send_char_bit_per_bit(int server_pid, char c);
int		send_string_char_by_char(int server_pid, char *str);
void	acknowledgement(int signal);
void	client_error(void);

/*
** minitalk_utils.c
*/
int		ft_strlen(char *str);
void	ft_putchar_fd(char c, int fd);
void	ft_putstr(char *str);
void	ft_putnbr_fd(int nbr, int fd);
int		ft_atoi(const char *str);

#endif
