# Autor: Andrés
# Fecha: 2024-03-06
# Descripción: 
#!/bin/bash

# Array con las direcciones IP a verificar
direcciones=("192.168.1.1" "8.8.8.8" "10.0.0.1")

# Función para verificar la accesibilidad de una dirección IP
verificar_ip() {
    local ip="$1"
    if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
        echo "$ip" >> "$1_ip_on"
    else
        echo "$ip" >> "$1_ip_off"
    fi
}

# Nombre del archivo de salida con las iniciales del nombre y apellidos

archivo_on="$(echo "Andrés Heras Leiva" | sed 's/\(.\).* \(.\).* \(.\).*/\1\2\3/')_ip_on"
archivo_off="$(echo "Andrés Heras Leiva" | sed 's/\(.\).* \(.\).* \(.\).*/\1\2\3/')_ip_off"

# EXPLICACION DE LAS LINEAS ANTERIORES:

# echo "Andrés Heras Leiva": Esto imprimirá el nombre del usuario que está ejecutando el script.
# sed 's/\(.\).* \(.\).* \(.\).*/\1\2\3/': Esto utiliza el comando sed para realizar 
# una sustitución en el nombre del usuario.
# La expresión regular s/\(.\).* \(.\).* \(.\).*/\1\2\3/ se descompone de la 
# siguiente manera:

# \(.\): Captura el primer carácter del nombre del usuario.

# .*: Representa cualquier cantidad de caracteres, excepto una nueva línea.

# \(.\): Captura el segundo carácter del nombre del usuario.

# .*: Representa nuevamente cualquier cantidad de caracteres.

# \(.\): Captura el tercer carácter del nombre del usuario.

# .*: Representa nuevamente cualquier cantidad de caracteres.

# .*: Representa cualquier cantidad de caracteres hasta el final de la línea.

# \1\2\3: Esto indica que vamos a sustituir todo el patrón coincidente con los tres 
# primeros caracteres capturados.


# Agregar fecha y hora al inicio de los archivos
fecha_actual=$(date +"%Y-%m-%d %H:%M:%S")
echo "Fecha y hora de la verificación: $fecha_actual" > "$archivo_on"
echo "Fecha y hora de la verificación: $fecha_actual" > "$archivo_off"

# Iterar sobre las direcciones IP y verificar su accesibilidad
for direccion in "${direcciones[@]}"; do
    verificar_ip "$direccion"
done

# Mensaje de conclusión
echo "Proceso de verificación de direcciones IP concluido."
