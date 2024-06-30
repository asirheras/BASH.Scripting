#!/bin/bash
# Script: Instalación pgAdmin4 para PostgreSQL
# Autor:	Andrés Heras
# Fecha:	20240630
# Descripción: Instalación pgAdmin4 para usar BBDD en PostgreSQL
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt upgrade
sudo apt install pgadmin4
sudo apt install pgadmin4-web 
sudo /usr/pgadmin4/bin/setup-web.sh
