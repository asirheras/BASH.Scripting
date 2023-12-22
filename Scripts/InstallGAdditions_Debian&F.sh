#!/bin/bash
# Script:InstalarGAdditions.sh
# Autor:	Andrés Heras
# Fecha:	24/11/2023
# Descripción:Instala las GuestAdditions de Virtualbox y crea un carpeta compartida, llamada "compartida" en Debian.
# Antes de ejecutar el script:
# 1) Tenemos que estar modo root
# - comprobar que el sistema sobre el en que se va a ejecutar el script tiene le directorio /mnt.
# No olvidar configurar la carpeta "compartida" en el sistema anfitrión a través de la interfaz gráfica del Virtualbox.

# Actualiza la información local de lista de paquetes del sistema anfitrión
 apt update
# Instala la actualizaciones disponible para los paquetes instalados en el sistema
 apt upgrade -y

# Instalar paquetes necesarios para la instalación de Guest Additions
 apt install -y gcc make perl build-essential dkms linux-headers-$(uname -r)

# Montar la imagen de Guest Additions
 mount /dev/sr0 /media/cdrom

# Ejecutar el script de instalación de Guest Additions
 sh /media/cdrom/VBoxLinuxAdditions.run

# Desmontar la imagen de Guest Additions
 umount /dev/sr0

# Creación de la carpeta "compartida"
 mkdir /mnt/compartida

# Configurar carpeta compartida y añadir al archivo /etc/fstab
echo "Compartida /mnt/compartida vboxsf defaults 0 0" |  tee -a /etc/fstab

# Reiniciar la máquina virtual para aplicar los cambios
 reboot




