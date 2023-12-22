#!/bin/bash
# Script:InstalarGAdditions.sh
# Autor:	Andrés Heras
# Fecha:	24/11/2023
# Descripción:Instalación de l GuestAdditions en Debian y derivados
#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update
#
sudo apt upgrade -y

# Instalar paquetes necesarios para la instalación de Guest Additions
sudo apt install -y gcc make perl build-essential dkms linux-headers-$(uname -r)

# Montar la imagen de Guest Additions
sudo mount /dev/sr0 /media/cdrom

# Ejecutar el script de instalación de Guest Additions
sudo sh /media/cdrom/VBoxLinuxAdditions.run

# Desmontar la imagen de Guest Additions
sudo umount /media/cdrom

# Reiniciar la máquina virtual para aplicar los cambios
sudo reboot




