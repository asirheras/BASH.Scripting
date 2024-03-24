#!/bin/bash

# Autor: Juan Ranchal
# Descripción: Funciones saludo
# Fecha: 08/02/2024

function saludo {
    local vlocal1=Paris
    typeset vlocal2=Madrid
    echo $vlocal1
    echo $vlocal2
}

clear

vglobal="Londres"

saludo

echo $vlocal1
echo $vlocal2
echo $vglobal