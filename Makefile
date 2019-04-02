# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cdenys-a <cdenys-a@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/07 18:13:37 by fwlpe             #+#    #+#              #
#    Updated: 2019/04/02 19:09:42 by cdenys-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fractol
OS = $(shell uname)
CC = gcc
LFT_DIR = libft/
LFT = $(addprefix $(LFT_DIR), libft.a)
SRCS = main.c hooks.c image.c draw.c prepares.c
OBJ_DIR = objects/
OBJS = $(addprefix $(OBJ_DIR), $(SRCS:.c=.o))
FLAGS = -Wall -Wextra -Werror -g

ifeq ($(OS), Linux)
	LMLX_FLAGS = -lXext -lX11 -lm
	LMLX_DIR = /dev/null
	LMLX = minilibx/libmlx_linux.a
	ADD = defines/linux/ -l OpenCL
else
	LMLX_FLAGS = -framework OpenGL -framework AppKit
	LMLX_DIR = minilibx_macos/
	LMLX = $(addprefix $(LMLX_DIR), libmlx.a)
	ADD = defines/mac/
endif

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS) $(LFT) $(LMLX)
	$(CC) $(OBJS) $(LFT) $(LMLX) $(LMLX_FLAGS) -o $(NAME) -I$(ADD)  -framework OpenCL

$(OBJ_DIR):
	mkdir $@

$(OBJ_DIR)%.o: %.c
	$(CC) $(FLAGS) -o $@ -c $^ -I$(ADD)

$(LFT):
	make -C $(LFT_DIR)

$(LMLX):
	make -C $(LMLX_DIR) || true

clean:
	make -C $(LFT_DIR) clean
	make -C $(LMLX_DIR) clean || true
	rm -f $(OBJS)

fclean:
	make -C $(LFT_DIR) fclean
	make -C $(LMLX_DIR) clean || true
	rm -rf $(OBJ_DIR)
	rm -f $(NAME)

re: fclean all

norm:
	norminette *.c *.h
