#!/bin/bash

#Activación en la shell del mecanismo de parada inmediata ante errores

set -e

# Función para comprobar si el archivo existe y preguntar al usuario si desea sobrescribirlo

comprobar_archivo() {
    local eleccion="$1"

    # Si el archivo existe, gestionamos el conflicto
    if [ -e "${eleccion}.sh" ]; then
        echo "¡ADVERTENCIA!: Ya existe un archivo con el nombre '${eleccion}.sh'."
        read -rp "¿Desea sobrescribirlo? (s/n): " respuesta

        case "$respuesta" in
            [sS])
                rm -f "${eleccion}.sh"
                nombre_archivo="$eleccion"
                ;;
            [nN])
                read -rp "Por favor, ingrese otro nombre para el archivo (sin .sh): " nuevo_nombre
                # Llamada recursiva con el nuevo nombre ingresado
                comprobar_archivo "$nuevo_nombre"
                ;;
            *)
                echo "Opción no válida. Solo se permite 's' o 'n'."
                # Llamada recursiva manteniendo el mismo eleccion para repetir la pregunta
                comprobar_archivo "$eleccion"
                ;;
        esac
    else
        # Caso base: el archivo no existe, asignamos el nombre validado
        nombre_archivo="$eleccion"
    fi
}

# 1. Solicitar el nombre inicial
read -rp "Por favor, ingrese el nombre del script (sin la extensión .sh): " nombre_inicial

# Validar que no se introduzca un valor en blanco
while [ -z "$nombre_inicial" ]; do
    read -rp "El nombre no puede estar vacío. Ingrese un nombre: " nombre_inicial
done

# 2. Iniciar la comprobación recursiva
comprobar_archivo "$nombre_inicial"

# Definir la ruta completa del archivo con el nombre ya consolidado
archivo="${nombre_archivo}.sh"

# 3. Solicitar datos adicionales
read -rp "Por favor, ingrese el nombre del autor: " nombre_autor
read -rp "Por favor, haga una breve descripción del script: " descripcion

# 4. Generar la cabecera completa en un único bloque
cat << EOF > "$archivo"
#!/bin/bash
# Autor: ${nombre_autor}
# Fecha: $(date +"%Y-%m-%d")
# Descripción: ${descripcion}
EOF

# 5. Permisos y apertura del editor
chmod +x "$archivo"
"${EDITOR:-nano}" "$archivo"


