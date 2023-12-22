#!/bin/bash
clear
echo "- 1 - Copia de seguridad "
echo "- 2 - Restaurar "
echo " -3 - Fin"
echo " Su elección: "
read respuesta

case "$respuesta" in
	1) echo "Su elección ha sido copia de seguridad"
	# Ejecución de la copia de seguridad
	;;
	2) echo "Su elección ha sido restaurar"
	# Ejecución de la restauración
	;;
	3) echo "Fina del tratamiento"
	  echo "Hasta luego..."	
	exit 0
	;;
	*) echo "Opción incorrecta"
	echo "Adios ...."
	exit 1
	;;
esac
