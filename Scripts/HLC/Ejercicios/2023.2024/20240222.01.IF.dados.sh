#!/bin/bash

# Función para generar un número aleatorio dentro del rango especificado
generar_numero_aleatorio() {
    local min=$1
    local max=$2
    echo $(( RANDOM % (max - min + 1) + min ))
}

echo "¡Bienvenido al juego de adivinanza de números!"
read -p "Ingresa el rango mínimo de números posibles: " minimo
read -p "Ingresa el rango máximo de números posibles: " maximo

# Validar que los rangos sean números enteros positivos
if ! [[ "$minimo" =~ ^[0-9]+$ ]] || ! [[ "$maximo" =~ ^[0-9]+$ ]]; then
    echo "Los rangos deben ser números enteros positivos."
    exit 1
fi

# Validar que el rango mínimo sea menor que el rango máximo
if (( minimo >= maximo )); then
    echo "El rango mínimo debe ser menor que el rango máximo."
    exit 1
fi

# Generar un número aleatorio dentro del rango especificado
numero_secreto=$(generar_numero_aleatorio $minimo $maximo)

echo "Intenta adivinar el número secreto entre $minimo y $maximo."
intentos=0

while true; do
    ((intentos++))
    read -p "Intento #$intentos - Ingresa tu suposición: " suposicion

    # Validar que la suposición sea un número entero
    if ! [[ "$suposicion" =~ ^[0-9]+$ ]]; then
        echo "Por favor, ingresa solo números."
        continue
    fi

    if (( suposicion < numero_secreto )); then
        echo "El número secreto es más alto."
    elif (( suposicion > numero_secreto )); then
        echo "El número secreto es más bajo."
    else
        echo "¡Felicidades! ¡Has adivinado el número secreto $numero_secreto en $intentos intentos!"
        break
    fi
done
