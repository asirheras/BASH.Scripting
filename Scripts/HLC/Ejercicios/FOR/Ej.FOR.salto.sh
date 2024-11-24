# Autor: Andrés Heras
# Fecha: 2024-03-07
# Descripción: El script se ejecuta con todos los valores de la variable menos el 4
#!/bin/bash
for i in {1..5}
# i: es un marcador de posición para una variable. Por su parte, $i es el valor individual 
# de la variable. También puedes escribirlo como c/$c o con cualquier otro nombre
do
  if [[ "$i" == '4' ]]
  then
    continue
  fi
  echo "Hai $i4"
done
