/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hooks.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fwlpe <fwlpe@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/18 14:02:03 by cdenys-a          #+#    #+#             */
/*   Updated: 2019/03/31 20:05:00 by fwlpe            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fractol.h"

int		deal_key(int key, t_fctl *s)
{
	(void)s;
	if (key == ESC)
		exit(0);
	if (key == SPACE)
		zero_draw(s);
	return (0);
}

int		mouse(int button, int x, int y, t_fctl *s)
{
	(void)x;
	if ((button == PLUS || button == MINUS) && y >= 0)
		zoom(button, s, x, y);
	return (0);
}

int		red_button(void *param)
{
	(void)param;
	exit(0);
	return (0);
}