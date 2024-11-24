# Autor: Andres Heras
# Fecha: 2024-03-07
# Descripción: Script para para crear el bucle omitir y continuar. Toma todos los valores 
#              menos el 4
#!/bin/bash

# SINTAXIS
#  for i in 1 2 3 4 5
#  do
#   if [condicion]
#   then
#      continue   #Pasa a la siguiente iteración de i en el bucle y omite la instrucción o statement
#   fi
#   statement
#  done



for i in {1..5}
do
  if [[ "$i" == '4' ]]
  then
    continue
  fi
  echo "Tengo valor $i"
done
