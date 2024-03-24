# Autor: Andres
# Fecha: 2024-03-06
# Descripción: Es un ejemplo
#!/bin/bash
#!/bin/bash

# Comprobar que se proporcionan dos parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <origen> <destino>"
    exit 1
fi

origen=$1
destino=$2

# Comprobar que el origen es un directorio válido
if [ ! -d "$origen" ]; then
    echo "El directorio de origen '$origen' no es válido."
    exit 2
fi

# Crear el directorio destino si no existe
if [ ! -d "$destino" ]; then
    mkdir -p "$destino"
    if [ $? -ne 0 ]; then
        echo "Error al crear el directorio destino '$destino'."
        exit 3
    fi
fi

# Iterar sobre todos los ficheros del directorio origen
for file in "$origen"/*; do
    if [ -f "$file" ]; then
        # Obtener fecha de modificación del fichero
        mod_date=$(stat -c %y "$file")
        year=$(date -d "$mod_date" +"%Y")
        month=$(date -d "$mod_date" +"%m")

        # Crear directorio año/mes si no existe
        mkdir -p "$destino/$year/$month"
        if [ $? -ne 0 ]; then
            echo "Error al crear directorio '$destino/$year/$month'."
            exit 3
        fi

        # Mover el fichero al directorio destino
        mv "$file" "$destino/$year/$month/"
        if [ $? -ne 0 ]; then
            echo "Error al mover el fichero '$file' a '$destino/$year/$month/'."
            exit 3
        fi
    fi
done

echo "Los ficheros del directorio '$origen' se han organizado correctamente en '$destino'."

exit 0
# Autor: Novel
# Fecha: 2024-03-06
# Descripción: dfsdfasdfsdfasdfasdf# Autor: Andrés
#!/bin/bash
