#!/bin/bash
read -p "Por favor, ingrese el nombre del script (sin la extensión sh):" nombre_archivo

# Función para comprobar si el archivo existe y preguntar al usuario si desea sobrescribirlo
comprobar_archivo() {
    if [ -e "$1.sh" ]; then
        echo "¡ADVERTENCIA!: Ya existe un archivo con el nombre $1.sh. Sobrescribirá el archivo existente."
        echo "¿Está seguro de que desea continuar? Esta acción eliminará permanentemente el archivo existente. (s/n)"
        read respuesta
        if [ "$respuesta" == "n" ]; then
            echo "Por favor, ingrese otro nombre para el archivo: "
            read nuevo_nombre
            comprobar_archivo "$nuevo_nombre"
        elif [ "$respuesta" != "s" ]; then
            echo "Error: Respuesta inválida. Solo se permite 's' o 'n'."
            exit 1
        else
            rm "$1.sh"
            echo "El archivo existente ha sido eliminado."
        fi
    fi
}

comprobar_archivo "$nombre_archivo"

read -p "Por favor, ingrese el nombre del autor: " nombre_autor

# Crear el archivo con el nombre proporcionado
touch "$nombre_archivo.sh"

# Agregar el autor y la fecha al archivo
echo "# Autor: $nombre_autor" >> "$nombre_archivo.sh"
echo "# Fecha: $(date +"%Y-%m-%d")" >> "$nombre_archivo.sh"

# Solicitar una breve descripción del script
read -p "Por favor, haga una breve descripción del script: " descripcion

# Agregar la descripción al archivo
echo "# Descripción: $descripcion" >> "$nombre_archivo.sh"

# Agregar she-bang
echo "#!/bin/bash" >> "$nombre_archivo.sh"

# Dar permisos de ejecución al archivo
chmod +x "$nombre_archivo.sh"

# Abrir el archivo con el editor nano
nano "$nombre_archivo.sh"
