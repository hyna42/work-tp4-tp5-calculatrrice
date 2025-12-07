#FICHIER PRINCIPAL
# find ../build/ -mindepth 1 -delete
cmake_minimum_required(VERSION 3.10)
# Définir les standards C
project(calculatrice C)

# ajout des sous répertoires
add_subdirectory(src)
add_subdirectory(lib/dynamicCalculatrice)
add_subdirectory(lib/staticCalculatrice)