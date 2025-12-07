# Création de la lib bibliothèque statique calcDynamic.so
add_library(calcDynamic SHARED dynamicCal.c)


#  Exposer les entêtes .h à l'exécutable
target_include_directories(calcDynamic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
