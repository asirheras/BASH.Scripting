#!/bin/bash
# Existencia de un usuario en el sistema"
if [ $# -ne 1 ]; then
	echo "Número de argumentos incorrecto"
	echo "Uso: $0 nombre_usuario"
 	exit 1
fi
# greg permite encontrar tesxto en un fichero
# parámetro q, modo silencioso para no mostrar nada en la
# salida estándar
# ^Indica en grep comienzo de linea 
# en nuestro caso comienzo de linea con el parámetro seguido de :
# grep devuelve verdad cuando al menos encuentra una línea.

if grep -q "^$1:" /etc/passwd
	then 
		echo "El usuario $1 existe en el sistema"
	else
		echo "El usuario $1 no existe en el sistema"
fi
exit 0
