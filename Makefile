# 1: gcc -std=c2x -pedantic -Wall -Wextra -Werror -E main.c -o main.i --> main.i (fichier nétttoyé)

# 2: gcc -std=c2x -pedantic -Wall -Wextra -Werror -S main.i -o main.s --> main.s (code assembleur)

# 3: gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.s -o main.o --> main.o (binaire)

# 4: gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.o -o prog

# commande directe 
# gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.o -o prog

#### varibales ####
FLAGS = -pedantic -Wall -Wextra -Werror
SRC = main.c
BIN = prog
CLEANED = prog prog.exe main.i main.s main.o
CLEANED-SHELL = prog.exe main.i main.s main.o 2>nul || true

#########################################################


#1. preprocessing
pprocess: 
	@gcc $(FLAGS) -E $(SRC) -o main.i

#2. compiling
compil: 
	@gcc $(FLAGS) -S main.i -o main.s

#3. assembling
assemb: 
	@gcc $(FLAGS) -c main.s -o main.o

#4. linking
link: 
	@gcc $(FLAGS) main.o -o $(BIN)

#génération du fichier exécutable prog
all : 
	@gcc $(FLAGS) $(SRC) -o $(BIN)

#exécution du programme
run: all
	@./$(BIN)

#nettoyage
clean: 
	@rm -f $(CLEANED)

.PHONY: all run clean