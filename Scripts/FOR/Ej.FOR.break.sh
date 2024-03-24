# Autor: Andres Heras
# Fecha: 2024-03-07
# Descripción: Script para crear una salida condicional con Break Loop. 
# 	       Crear un fin para bucle FOR
#!/bin/bash

echo ' No puedo dormir.¡Voy a contar 100 ovejitas'
echo "-------------------------"

# Bucle for para contar ovejitas
for (( i=1; i<=100; i++ )); do
    if [ $i -eq 4 ]; then
        echo "ZZZZZZZZZZZZZZZZZzzzzzzzzzzzzzzzz"
        break
    fi

    if [ $i -eq 1 ]; then
        echo "$i ovejita"
    else
        echo "$i ovejitas"
    fi
    
    sleep 1  # Simula el proceso de contar
done
