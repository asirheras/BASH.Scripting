
#Escribe un script que tome un directorio COMO ARGUMENTO($1) y cuente cuántos archivos de ese directorio tienen la extensión .txt.
----------------------------------------------------------------------------------------------------------------------------------
#Descripción: Este script toma el directorio como argumento de línea de comandos ($1) y 
#verifica si se proporcionó un directorio y si ese directorio existe. Luego, utiliza el 
#comando find para buscar archivos con extensión .txt en el directorio especificado y cuenta
#la cantidad de archivos encontrados utilizando wc -l. Finalmente, imprime la cantidad de 
#archivos con extensión .txt encontrados en el directorio.

#!/bin/bash

# Verificar si se proporcionó un directorio como argumento
# 
if [ -z "$1" ]; then
    echo "Uso: $0 directorio"
    exit 1
fi

# Verificar si el directorio proporcionado existe
if [ ! -d "$1" ]; then
    echo "El directorio '$1' no existe."
    exit 1
fi


# Contar los archivos con extensión .txt en el directorio especificado
cantidad_txt=$(find "$1" -maxdepth 1 -type f -name "*.txt" | wc -l)

# Imprimir la cantidad de archivos con extensión .txt
echo "Cantidad de archivos con extensión .txt en el directorio '$1': $cantidad_txt"
