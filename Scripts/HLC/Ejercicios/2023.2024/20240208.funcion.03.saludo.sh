#!/bin/bash

# Autor: Juan Ranchal
# Descripción: Funciones mensaje
# Fecha: 08/02/2024

function saludo {
    if [ $# -eq 1 ]; then
        mensaje=$1
    elif [ $# -gt 1 ]; then
        echo "Demasiados argumentos"
    else
        mensaje="Mundo"
    fi
    echo "Hola $mensaje"
}

clear

saludo Cordoba
#saludo Madrid
#saludo Nueva York
saludo
saludo Cordoba Madrid