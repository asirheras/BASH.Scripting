
#!/bin/bash

# Actualizar los paquetes del sistema
sudo apt update 
sudo apt upgrade -y

# Instalar Apache2 y PHP
sudo apt install apache2 php libapache2-mod-php php-mysql -y

# Iniciar y habilitar el servicio de Apache
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "Apache2 y PHP instalados y servicio iniciado."
# Reiniciar el servicio de Apache para aplicar los cambios
# sudo systemctl restart apache2

# Crear un archivo PHP de prueba
sudo echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
sudo echo "Archivo info.php creado en /var/www/html/"
sudo echo "Instalación de Apache y PHP completada. Puedes verificar la instalación visitando http://your-instance-public-dns/info.php en tu navegador."

# Cambiar el document root a f1aws

set -e

# Variables
NEW_ROOT="/var/www/html/f1aws"
CONF_FILE="/etc/apache2/sites-available/000-default.conf"
BACKUP_FILE="${CONF_FILE}.bak"

sudo echo "1) Creando carpeta $NEW_ROOT"
sudo mkdir -p "$NEW_ROOT"

sudo echo "2) Ajustando permisos y propietario"
sudo chown -R www-data:www-data "$NEW_ROOT"
sudo chmod -R 755 "$NEW_ROOT"
# Se acabaron aqui los echo con sudo
echo "3) Respaldando configuración actual"
if [ ! -f "$BACKUP_FILE" ]; then
  sudo cp "$CONF_FILE" "$BACKUP_FILE"
  echo "   Archivo respaldado en $BACKUP_FILE"
else
  echo "   Ya existe respaldo en $BACKUP_FILE"
fi

echo "4) Modificando DocumentRoot en $CONF_FILE"
# Usamos sed para cambiar DocumentRoot
sudo sed -i -E "s|DocumentRoot\s+/var/www/html|DocumentRoot $NEW_ROOT|g" "$CONF_FILE"

# Añadir bloque <Directory> si no existe

if ! grep -q "<Directory $NEW_ROOT>" "$CONF_FILE"; then
  cat <<EOF >> "$CONF_FILE"
<Directory $NEW_ROOT>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
EOF
  echo "   Bloque <Directory> añadido."
else
  echo "   Bloque <Directory> ya presente."
fi

echo "5) Probando configuración de Apache"
sudo apache2ctl configtest

echo "6) Recargando Apache"
sudo systemctl reload apache2

echo "¡Listo! Ahora DocumentRoot apunta a $NEW_ROOT"
