/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: grannou <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/10 07:46:25 by grannou           #+#    #+#             */
/*   Updated: 2021/08/10 07:46:33 by grannou          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

int	send_char_bit_per_bit(int server_pid, char c)
{
	int		left_shift;
	int		signal;

	left_shift = 0;
	while (++left_shift <= 8)
	{
		if (c & MASK)
			signal = SIGUSR1;
		else
			signal = SIGUSR2;
		if (kill(server_pid, signal) == -1)
			return (-1);
		usleep(OS_LATENCY);
		c = c << 1;
	}
	return (0);
}

int	send_string_char_per_char(int server_pid, char *str)
{
	while (*str)
	{
		if (send_char_bit_per_bit(server_pid, *str) == -1)
			return (-1);
		str++;
	}
	if (send_char_bit_per_bit(server_pid, '\0') == -1)
		return (-1);
	return (0);
}

void	acknowledgement(int signal)
{
	if (signal == SIGUSR1)
		ft_putstr(GRANNOU "\n\n" ME GREEN "            Message received      " \
			RESET ME RESET "\n\n" GRANNOU "\n");
}

void	client_error(void)
{
	ft_putstr(GRANNOU "\n\n" ME "   Please launch: " GREEN "./client " \
		PURPLE "[PID] " YELLOW "[Message]  " ME "\n\n" RESET GRANNOU "\n");
}

int	main(int argc, char *argv[])
{
	int					client_pid;
	struct sigaction	msg;

	client_pid = getpid();
	msg.sa_handler = acknowledgement;
	sigaction(SIGUSR1, &msg, NULL);
	if (argc == 3 && ((ft_atoi(argv[1]) > 0) && argv[2]))
	{
		if (send_string_char_per_char(ft_atoi(argv[1]), argv[2]) == -1)
		{
			ft_putstr(CRASH RED " Transmission error" RESET CRASH "\n");
			return (1);
			pause();
		}
	}
	else
	{
		client_error();
		return (1);
	}
	return (0);
}
