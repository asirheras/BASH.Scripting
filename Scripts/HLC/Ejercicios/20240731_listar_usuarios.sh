#!/bin/bash

# Mostrar todos los usuarios del sistema
echo "Usuarios del sistema:"

# Leer el archivo /etc/passwd
cat /etc/passwd | while IFS=: read -r username _; do
    echo "$username"
done
