
NAME = libft.a

CC = cc
CFLAGS =  -Wall -Wextra -Werror
ARFLAGS = ar -rcs
REMOVE = rm -rf

OBJ_PATH = obj
SRC_PATH = src
INC_PATH = inc

R = \033[1;31m
G = \033[1;32m
C = \033[1;36m
O = \033[1;38;5;208m
P = \033[1;38;5;141m
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
	@echo "\n$(P)[Compiled $(C)'$@' $(G)successfully]\n$(END)"

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC_PATH)/libft.h
	mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -I $(INC_PATH) -c $< -o $@

clean:
	$(REMOVE) $(OBJ_PATH)
	@echo "\n$(O)[Cleaned $(C) $(NAME) objects $(G)successfully]\n$(END)"

fclean: clean
	$(REMOVE) $(NAME)
	@echo "$(R)[Removed $(C)'$(NAME)' $(G)successfully]\n$(END)"

re: fclean all
