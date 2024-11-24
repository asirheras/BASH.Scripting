#!/bin/bash

# Comprobar si se proporciona un archivo como argumento
if [ $# -eq 1 ]; then
    archivo="$1"
    if [ -f "$archivo" ]; then
        # Contar palabras en el archivo
        num_palabras=$(wc -w < "$archivo")
        echo "El archivo '$archivo' contiene $num_palabras palabras."
    else
        echo "Error: El archivo '$archivo' no existe."
        exit 1
    fi
else
    # Contar palabras desde la entrada estándar
    echo "Introduce el texto y presiona Ctrl+D cuando termines:"
    num_palabras=$(wc -w)
    echo "El texto introducido contiene $num_palabras palabras."
fi
