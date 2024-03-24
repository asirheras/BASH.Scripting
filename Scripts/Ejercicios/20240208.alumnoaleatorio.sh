#!/bin/bash
# Script: alumno
# Autor:	Andrés Heras
# Fecha:	20240208
# Descripción:

alumnos=("Fran" "Javi" "Luis")
#Generar un número aleatorio enter 0 y la longitud del array de alumnos

num_aleatorio=$((RANDOM % ${#alumnos[@]}))

#Seleccionar al alumno aleatorio

alumno_seleccionados=${alumnos[$num_aleatorio]}

#Mostrar el alumno seleccionado

echo "La victima de hoy es: $alumno_seleccionado"