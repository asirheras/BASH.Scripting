#Author:Andres Heras
#Fecha: 27/04/2024
#Description: El scritp crea un usuario sobre una BD y le otorga todos los privilegios.
#             Es necesario incluir antes el usuario ROOT y su clave

#!/bin/bash

# Solicitar el nombre de usuario
read -p "Ingrese el nombre del usuario de MySQL: " MYSQL_USER
# Solicitar la base de datos
read -p "Ingrese el nombre de la base de datos: " DATABASE_NAME
# Solicitar la contraseña del usuario (opcional)
read -s -p "Ingrese la contraseña para el usuario de MySQL: " MYSQL_PASSWORD
echo

# Credenciales de MySQL (cambiar según sea necesario)
MYSQL_ROOT_USER="root"
MYSQL_ROOT_PASSWORD="rootpassword"

# Crear el usuario en MySQL y otorgar privilegios
mysql -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD <<EOF
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "El usuario '$MYSQL_USER' ha sido creado y se le han otorgado todos los privilegios sobre la base de datos '$DATABASE_NAME'."
