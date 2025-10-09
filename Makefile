# 1: gcc -std=c2x -pedantic -Wall -Wextra -Werror -E main.c -o main.i --> main.i (fichier nétttoyé)

# 2: gcc -std=c2x -pedantic -Wall -Wextra -Werror -S main.i -o main.s --> main.s (code assembleur)

# 3: gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.s -o main.o --> main.o (binaire)

# 4: gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.o -o prog

# commande directe 
# gcc -std=c2x -pedantic -Wall -Wextra -Werror main.c -o prog

#### varibales ####
CC = gcc
FLAGS = -pedantic -Wall -Wextra -Werror
SRC = main.c functions.c
BIN = prog
CLEANED = prog prog.exe main.i main.s main.o

#########################################################


#1. preprocessing
pprocess: 
	@$(CC) $(FLAGS) -E $(SRC) -o main.i

#2. compiling
compil: 
	@$(CC) $(FLAGS) -S main.i -o main.s

#3. assembling
assemb: 
	@$(CC) $(FLAGS) -c main.s -o main.o

#4. linking
link: 
	@$(CC) $(FLAGS) main.o -o $(BIN)

#génération du fichier exécutable prog
all : 
	@$(CC) $(FLAGS) $(SRC) -o $(BIN)

#exécution du programme
run: all
	@./$(BIN)

#nettoyage
clean: 
	@rm -f $(CLEANED)

.PHONY: all run clean