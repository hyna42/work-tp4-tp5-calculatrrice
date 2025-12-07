# Création de la lib bibliothèque statique calcStatic.a
add_library(calcStatic STATIC staticCal.c)

#  Exposer les entêtes .h à l'exécutable
target_include_directories(calcStatic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

