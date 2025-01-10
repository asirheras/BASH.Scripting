#!/bin/bash

# Verificar si se proporcionó un directorio como argumento
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
