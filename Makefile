# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: ppichier <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2017/11/24 14:00:28 by ppichier     #+#   ##    ##    #+#        #
#    Updated: 2018/04/17 11:18:39 by ppichier    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.PHONY: all clean fclean re

CC = gcc

FLAGS = -Werror -Wextra -Wall

NAME = libft.a

DIR_LIBFT = sources/

DIR_HEADER = includes

DIR_OBJ = objects/

DIR_PRINTF = sources/ft_printf/

LIBFT = ft_atoi.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c \
		ft_isprint.c ft_putchar.c ft_putchar_fd.c \
		ft_putendl.c ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c ft_putstr.c \
		ft_putstr_fd.c ft_strcat.c ft_strchr.c ft_strcmp.c \
		ft_strcpy.c ft_strdup.c ft_strlen.c ft_strncat.c ft_strncmp.c \
		ft_strncpy.c ft_strnstr.c ft_strrchr.c ft_strstr.c ft_tolower.c \
		ft_toupper.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c \
		ft_memchr.c ft_memcmp.c ft_memalloc.c ft_memdel.c ft_strnew.c \
		ft_strdel.c ft_strclr.c ft_striter.c ft_striteri.c ft_strmap.c \
		ft_strmapi.c ft_strequ.c ft_strnequ.c ft_memmove.c ft_strsub.c \
		ft_strjoin.c ft_strtrim.c ft_strsplit.c ft_itoa.c \
		ft_strlcat.c ft_islower.c ft_isupper.c ft_swap.c ft_isgraph.c \
		ft_isspace.c ft_lstnew.c ft_lstdelone.c ft_lstdel.c ft_lstadd.c \
		ft_lstiter.c ft_lstmap.c ft_putstr2d.c ft_lstaddnext.c ft_sqrt.c \
		ft_sort_int_tab.c ft_sort_int_tab_int.c ft_strrev.c ft_icountbase.c \
		ft_itoa_base.c ft_strtolower.c ft_conv_intoctal.c ft_putnbrunsint.c \
		ft_putnbrlong.c ft_itoa_base_unsint.c ft_itoa_base_long.c \
		write_count.c ft_putchar_count.c ft_putstr_count.c \
		ft_putnbrlong_count.c ft_putnbrunsint_count.c ft_itosh.c ft_itoshsh.c \
		ft_uitosh.c ft_uitoshsh.c ft_strnew_a_size.c ft_len_wchar.c \
		ft_count_octets.c ft_tabcpy.c ft_atoi_intmax.c ft_strsplit_ws.c \
		ft_sort_int_notcast_tab.c ft_tabcpy_int.c ft_cmptab.c \
		ft_tab_is_sort.c get_next_line.c ft_is_sort_rev_tab.c \
		ft_tab_min.c \

PRINTF = ft_char.c ft_first_check_format.c ft_hexa.c \
				  ft_hexa_unicode_central.c ft_iam_d_i.c ft_iam_u.c \
				  ft_parse_init.c ft_parsing.c ft_printf.c ft_string.c \
				  ft_tools_check.c ft_tools_hexa.c ft_type.c ft_unicode.c \
				  ft_va_arg_parse.c ft_wc.c ft_wchar.c \

OBJ = $(addprefix $(DIR_OBJ), $(LIBFT:.c=.o)) $(addprefix $(DIR_OBJ), $(PRINTF:.c=.o))

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[33;32m=== Compilation de la librairie...\t\t\tDONE"
	@ar rcs $(NAME) $(OBJ)

$(DIR_OBJ)%.o: $(DIR_LIBFT)%.c
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Compiling:\033[0m" $<
	@mkdir -p $(DIR_OBJ)
	@$(CC) -I $(DIR_HEADER)$(CFLAGS) -o $@ -c $<

$(DIR_OBJ)%.o: $(DIR_PRINTF)%.c
	@echo "\033[0;32m [OK] \033[0m       \033[0;33m Compiling:\033[0m" $<
	@mkdir -p $(DIR_OBJ)
	@$(CC) -I $(DIR_HEADER)$(CFLAGS) -o $@ -c $<

clean:
	rm -rf $(DIR_OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all
