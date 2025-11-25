############################################
# OPTIONS GENERALES
############################################

CC = gcc
CFLAGS = -std=c2x -pedantic -Wall -Wextra -Werror

# Dossiers
BUILD   = src/build
BIN     = src/bin
STATIC  = src/lib/staticCalculatrice
DYNAMIC = src/lib/dynamicCalculatrice

# Fichiers sources
MAIN = src/app/main.c
CALC = src/lib/calc.c

# Création des dossiers si inexistants
$(shell mkdir -p $(BUILD) $(BIN))

############################################
#             A - LIB STATIQUE
############################################

#1. compilation statique
static: $(BIN)/prog_static

$(BUILD)/main_static.o: $(MAIN)
	@$(CC) $(CFLAGS) -c $(MAIN) -o $(BUILD)/main_static.o

$(BUILD)/calc_static.o: $(CALC)
	@$(CC) $(CFLAGS) -c $(CALC) -o $(BUILD)/calc_static.o

$(STATIC)/libStaticCal.a: $(BUILD)/calc_static.o
	@ar rcs $(STATIC)/libStaticCal.a $(BUILD)/calc_static.o

$(BIN)/prog_static: $(BUILD)/main_static.o $(STATIC)/libStaticCal.a
	@$(CC) $(BUILD)/main_static.o -L$(STATIC) -lStaticCal -o $(BIN)/prog_static
	@echo "✔ Compilation statique terminée."

#2. exécution du programme static
run-static: $(BIN)/prog_static
	@./$(BIN)/prog_static


############################################
#             B - LIB DYNAMIQUE
############################################

# 1. compilation dynamique
dynamic: $(BIN)/prog_dynamic

$(BUILD)/main_dynamic.o: $(MAIN)
	@$(CC) $(CFLAGS) -c $(MAIN) -o $(BUILD)/main_dynamic.o

$(BUILD)/calc_dynamic.o: $(CALC)
	@$(CC) $(CFLAGS) -fPIC -c $(CALC) -o $(BUILD)/calc_dynamic.o

$(DYNAMIC)/libDynamicCal.so: $(BUILD)/calc_dynamic.o
	@$(CC) -shared -o $(DYNAMIC)/libDynamicCal.so $(BUILD)/calc_dynamic.o

$(BIN)/prog_dynamic: $(BUILD)/main_dynamic.o $(DYNAMIC)/libDynamicCal.so
	@$(CC) $(BUILD)/main_dynamic.o -L$(DYNAMIC) -lDynamicCal -o $(BIN)/prog_dynamic
	@echo "✔ Compilation dynamique terminée."

# 2. exécution  du programme dynamic
run-dynamic: $(BIN)/prog_dynamic
	@LD_LIBRARY_PATH=$(DYNAMIC) ./$(BIN)/prog_dynamic


############################################
#                  CLEAN
############################################

clean:
	@rm -f $(BUILD)/*.o
	@rm -f $(STATIC)/*.a
	@rm -f $(DYNAMIC)/*.so
	@rm -f $(BIN)/*
	@echo "✔ Nettoyage terminé."

.PHONY: static dynamic run-static run-dynamic clean