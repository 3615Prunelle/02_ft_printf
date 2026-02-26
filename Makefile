# All notes are now in the Makefile template
NAME = libftprintf.a

CC = cc

CFLAGS = -Wall -Wextra -Werror -I ../98_include
LFLAGS = -L ../99_lib -lft

SRCS = 	ft_printf_common_specifiers.c \
		ft_printf_hexa_specifiers.c \
		ft_printf.c

OBJS = $(SRCS:.c=.o)

# If I'm on my own machine (campus or home), update the 98 & 99 Folders - UPDATE ALL MAKEFILES w/ home data (whoamI at home is not schappuy)
UPDATE_PERSO := $(shell whoami)
CURRENT_DIR = $(shell basename $$PWD)

ifeq ($(UPDATE_PERSO), schappuy)
ifeq ($(CURRENT_DIR), 02_ft_printf)
		EXTRA := install
	endif
endif

all: $(NAME) bonus $(EXTRA)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

install:
	cp ft_printf.h ../98_include
	cp libftprintf.a ../99_lib

.PHONY: all clean fclean re
