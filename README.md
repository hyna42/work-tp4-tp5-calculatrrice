# TP7 — CMake : compilation du projet (calculatrice)
<u>**Définition**</u> : **CMAKE** est un système de construction (Build System) Multiplateforme qui permet de génèrer des fichiers de configuration pour d'autres outils de compilation telsque le `Makefile` afin de compiler le projet partout avec n'importe quel outil, sans toucher au code.


## 1. Commence par la création d'un `CMakeLists.txt` principal à la racine du projet : 
    - le nom du projet : `project(calculatrice C)
    

## 2. Creer le dossier build/ puis lancer `cmake` 
![alt text](/assets/cmake_build_init.png)


## 3. Ajout des sous-répertoires lib/  et src/  dans le ficher CMakeLists.tsx principal avec la commande `add_subdirectory(source_dir)`

## 4. Creer la lib statique `calcStatic.a` PUIS Exposer ses entêtes à l'exécutable `lib/staticCalculatrice/CMakeLists.txt`
![alt text](/assets/staticLib.png)

## 5. Créer la lib dynamique `calcDynamic.so` PUIS Exposer ses entêtes à l'exécutable `lib/dynamicCalculatrice/CMakeLists.txt`
![alt text](/assets/dynamicLib.png)


## 5. Créer l'exécutable `app` avec `add_executable(app main.c)` PUIS lier les libs. avec `target_link_libraries(app calcStatic calcDynamic)`



















































<!-- 
2. création du dossier build  dans src/ afin de respecter le standard CMake `out-of-source build`  L'avantage de cette méthode c'est qu'on peut supprimer build/ pour tout nettoyer, tout en gardant le code source propre

3. Construction des fichiers sources du projet comportant depuis /build avec la commande `cmake ../app`

Cette commande permet de créer entre autres :
- Le dossier `CMakeFiles/`
- Le fichier `CMakeCache.txt`
- Le ficher `Makefile`

![alt text](/assets/cmake_init.png)

4. Dans /build , on lance la commande `make` pour générre l'éxécutable **`app`** pour lancer le projet.

![alt text](/assets/create-exec.png)

On peut ensuite tester le programme avec la commande `./app` pour afficher notre ***'hello world'***
![alt text](/assets/test-run-app.png)

# arborescence -->