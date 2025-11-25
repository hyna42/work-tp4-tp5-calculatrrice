#options du compilateur
FLAGS=-std=c2x -pedantic -Wall -Wextra -Werror

# Fichiers source
SRC=main.c \
	lib/functions/calc.c \

# Compilateur C
CC= gcc

# Nom de l'executable
PROG= prog


###########################################
### ****  B. LIBRAIRIES DYNAMIQUES **** ###
###########################################

all: $(PROG)
	@./bin/$(PROG)

$(PROG): $(SRC)
	@$(CC) $(FLAGS) $(SRC) -o $(PROG)

clean:
	@rm -f $(PROG)*.o


gdb: $(PROG)
	@gdb $(PROG)