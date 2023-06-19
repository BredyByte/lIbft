
NAME = libft.a

CC = cc
CFLAGS =  -Wall -Wextra -Werror
ARFLAGS = ar -rcs
REMOVE = rm -rf

OBJ_PATH = obj
SRC_PATH = src
INC_PATH = inc

R = \033[31;1m
G = \033[32;1m
B = \033[34;1m
M = \033[35;1m
C = \033[36;1m
Y = \033[33;1m
END = \033[0m

.DEFAULT_GOAL := all

SRC := $(filter-out $(SRC_PATH)/*_bonus.c, $(wildcard $(SRC_PATH)/*.c))
BONUS_SRC := $(wildcard $(SRC_PATH)/*_bonus.c)

OBJ = $(addprefix $(OBJ_PATH)/, $(notdir $(SRC:.c=.o)))
BONUS_OBJ = $(addprefix $(OBJ_PATH)/, $(notdir $(BONUS_SRC:.c=.o)))

.PHONY: all clean fclean re

.SILENT:

all: $(NAME)

$(NAME): $(OBJ)
	$(ARFLAGS) $@ $(OBJ)
	@echo "\n$(G)[Compiled $(C)'$@' $(G)successfully]\n$(END)"

bonus: $(OBJ) $(BONUS_OBJ)
	$(ARFLAGS) $(NAME) $(OBJ) $(BONUS_OBJ)

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC_PATH)/libft.h
	mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -I $(INC_PATH) -c $< -o $@

clean:
	$(REMOVE) $(OBJ_PATH)
	@echo "\n$(Y)[Cleaned $(C) $(NAME) objects $(Y)successfully]\n$(END)"

fclean: clean
	$(REMOVE) $(NAME)
	@echo "$(R)[Removed $(C)'$(NAME)' $(R)successfully]\n$(END)"

re: fclean all
