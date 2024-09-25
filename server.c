/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: grannou <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/24 12:26:19 by grannou           #+#    #+#             */
/*   Updated: 2021/08/10 07:43:12 by grannou          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	print_server_pid(int server_pid)
{
	ft_putstr(GRANNOU "\n\n" ME GREEN"            Server's PID: " RESET);
	ft_putnbr_fd(server_pid, 1);
	ft_putstr("            " ME "\n\n" RESET GRANNOU "\n");
}

void	handle_signal(int signal, siginfo_t *infos, void *oldact)
{
	static char	char_to_print = 0;
	static int	left_shift = 0;

	(void)infos;
	(void)oldact;
	char_to_print = char_to_print << 1;
	if (signal == SIGUSR1)
		char_to_print += 1;
	if (signal == SIGUSR2)
		char_to_print += 0;
	if (++left_shift == 8)
	{
		if (char_to_print == '\0')
			kill(infos->si_pid, SIGUSR1);
		else
			ft_putchar_fd(char_to_print, 1);
		left_shift = 0;
		char_to_print = 0;
	}
}

void	server_error(void)
{
	ft_putstr(GRANNOU "\n\n" ME "   Please launch server alone: " GREEN \
		"./server   " ME "\n\n" RESET GRANNOU "\n");
}

int	main(int argc, char *argv[])
{
	struct sigaction	msg;

	msg.sa_sigaction = handle_signal;
	(void)argv;
	if (argc == 1)
	{
		sigaction(SIGUSR1, &msg, NULL);
		sigaction(SIGUSR2, &msg, NULL);
		print_server_pid(getpid());
	}
	else
	{
		server_error();
		return (1);
	}
	while (1)
		pause();
	return (0);
}
