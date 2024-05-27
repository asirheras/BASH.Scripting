#!/bin/bash

# Actualizar los paquetes del sistema
sudo apt update -y
sudo apt upgrade -y

# Instalar Apache2 y PHP
sudo apt install -y apache2 php libapache2-mod-php

# Iniciar y habilitar el servicio de Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Reiniciar el servicio de Apache para aplicar los cambios
sudo systemctl restart apache2

# Crear un archivo PHP de prueba
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

echo "Instalación de Apache y PHP completada. Puedes verificar la instalación visitando http://your-instance-public-dns/info.php en tu navegador."
