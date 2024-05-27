#!/bin/bash
#Autor: Andres Heras
#Description: Este script configura MariaDB para conexiones remotas

# Solicitar el nombre de usuario
read -p "Ingrese el nombre del usuario de MySQL que desea crear que tendrá todos los privilegios sobre las tablas de la base de datos: " MYSQL_USER
read -s -p "Ingrese la contraseña para el usuario de MySQL: " MYSQL_PASSWORD
read -p "¿Cuál es el nombre de la BD? " BDATOS


# Configurar MySQL para aceptar conexiones remotas
sudo sed -i "s/bind-address\s*=.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb.service 

# Crear el usuario y otorgar permisos
sudo mysql -u root -p <<EOF
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $BDATOS.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "Configuración completada. Asegúrese de que el puerto 3306 esté abierto en el grupo de seguridad de AWS."
