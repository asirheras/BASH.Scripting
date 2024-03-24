# Autor: Andrés Heras
# Fecha: 2024-03-07
# Descripción: realice copias de seguridad del directorio personal del
#!/bin/bash

# backup es el directorio al que le vamos a ser copia.
# Si NO ponemos argumento al script hará copia por defecto a ~

NObackup =("~/Musica" "~/Descargas" "Escritorio" )
backup = tar ${1 - $HOME} --exclude=$NObackup
servidores=("10.0.2.15" "192.168.12.144" "192.168.1.0")

for i in $servidores;do

scp://$servidores $backup

done

