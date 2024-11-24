#!/bin/bash

# Escribe un script que liste todos los archivos del directorio actual y luego imprima cuántos archivos hay en total
# Listar todos los archivos del directorio actual
archivos=$(ls -p | grep -v /)

# Imprimir la lista de archivos
echo "Archivos en el directorio actual:"
echo "$archivos"

# Contar el número de archivos
total_archivos=$(echo "$archivos" | wc -l)

# Imprimir el número total de archivos
echo "Total de archivos: $total_archivos"


