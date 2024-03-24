#!/bin/bash
# Script: DNS
# Autor:	Andrés Heras
# Fecha:	20240307
# Descripción: listar informacion en el DNS de una lista de direcciones web
#!/bin/bash

for HOST in www.google.com www.altavista.com www.yahoo.com
do
  echo "-----------------------"
  echo $HOST
  echo "-----------------------"
  
  /usr/bin/host $HOST
  echo "-----------------------"

done

