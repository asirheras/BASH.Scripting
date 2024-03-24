#!/bin/bash
#Crea un script que lea un número y determine si es positivo, negativo o cero.
# Solicitar al usuario que ingrese un número
read -p "Ingrese un número: " numero
# Verificar si el número es positivo, negativo o cero
if [ $numero -gt 0 ]; then
    echo "El número ingresado es positivo."
elif [ $numero -lt 0 ]; then \r 
    echo "El número ingresado es negativo."
else
    echo "El número ingresado es cero."
fi