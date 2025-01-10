# Autor: Andrés Heras
# Fecha: 2024-03-07
# Descripción: Administrar un sistema de coias de seguridad. ESte script 
# 	       permitirá la selección de archivos y directorios para respaldar, 
# 	       así como la visualización, creación y eliminación de copias de 
#	       seguridad

#!/bin/bash
# Directorio de copias de seguridad
backup_dir="copia_seguridad"

# Verificar si el directorio de copias de seguridad existe, si no, crearlo
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    echo "Directorio $backup_dir creado."
fi

# Función para realizar copia de seguridad
realizar_copia() {
    origen=$1
    fecha=$(date +"%Y-%m-%d-%H-%M-%S")
    backup_file="$backup_dir/backup_file_$fecha.tar.gz"
    tar czf "$backup_file" "$origen" || exit 1
    echo "Copia de seguridad creada: $backup_file"
}

# Función para mostrar copias de seguridad
mostrar_copias() {
    echo "Listado de copias de seguridad:"
    ls -l "$backup_dir"
}

# Función para borrar copia de seguridad
borrar_copia() {
    read -p "Introduce el nombre de la copia que deseas borrar: " copia
    rm "$backup_dir/$copia" || exit 1
    echo "Copia de seguridad borrada: $copia"
}

# Función para verificar copias de seguridad
verificar_copias() {
    for archivo in "$backup_dir"/*.tar.gz; do
        tar tf "$archivo" >/dev/null || mv "$archivo" "${archivo%.tar.gz}_error.tar.gz"
    done
    echo "Verificación completada."
}

# Menú interactivo
while true; do
    echo "Menú de opciones:"
    echo "1. Copia de seguridad"
    echo "2. Mostrar copias"
    echo "3. Borrar copia"
    echo "4. Verificar copias"
    echo "5. Salir"

    read -p "Selecciona una opción: " opcion

    case $opcion in
        1) read -p "Introduce el directorio que deseas respaldar: " directorio
           realizar_copia "$directorio";;
        2) mostrar_copias
		;;
        3) borrar_copia
		;;
        4) verificar_copias
		;;
        5) echo "Saliendo del programa."
           break
		;;
        *) echo "Opción no válida."
	;;
esac
done
