# Crea un script que busque archivos de log mayores al tamaño en megas especificado como argurmento  y los comprima.

Enviar mensaje a #comentariotexto



#!/bin/bash

# Verifica si se proporciona el nombre del servicio como argumento
if [ $ -eq 0]; then
    echo "Para ejecutar este script hay que hacerlo de estar manera (Uso): $0 <tamaño en MB>"
    exit 1
fi
directorio=/var/log
for archivo in $directorio/*.log; do
tam=$(du -m $archivo|cut -f 1)
gzip $tam
if []
done
