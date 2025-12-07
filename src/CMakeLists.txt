# créer l'exécutable
add_executable(app main.c)

# lier les librairies statique et dynamiques à l'exécutable app
target_link_libraries(app calcStatic calcDynamic)