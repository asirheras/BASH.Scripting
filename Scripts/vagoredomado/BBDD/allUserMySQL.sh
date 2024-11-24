#!/bin/bash

# Credenciales de MySQL (cambiar según sea necesario)
MYSQL_ROOT_USER="root"
MYSQL_ROOT_PASSWORD="rootpassword"

# Mostrar todos los usuarios de MySQL
mysql -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "SELECT User, Host FROM mysql.user;"
