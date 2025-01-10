#⬜La configuración se basará en la configuración por defecto default-ssl de apache2
#⬜Crearemos el certificado y la clave privada de nuestra autoridad de certificación
#⬜Crearemos ahora el certificado SSL para nuestro dominio
#⬜Configuraremos el virtualhost de apache2 para que use el certificado de servidor
#⬜Nos aseguraremos de poder iniciar apache sin necesidad de introducir la clave del 
#certificado, es decir, eliminamos la protección por clave del certificado.
#⬜Crearemos el certicado SSL para un usuario
#⬜Importaremos el certificado a nuestro cliente
#⬜Configuraremos el servidor para usar certificados de cliente
#⬜Comprobaremos el acceso al servidor de forma que aparezca nuestro nombre o correo 
#electrónico al acceder al servidor mediante https. Crearemos un fichero index.php que 
#contenga el código necesario para mostrar información del certificado del cliente, 
#como el CommonName o el correo electrónico.

#Requisitos previos
#sudo apt install apache2 -y
#a2enmod ssl
#systemctl restart apache2

#Generación de CA y certificados de servidor:

openssl req -newkey rsa:2048 -nodes -keyform PEM -keyout selfsigned-ca.key -x509 -days 3650 -outform PEM -out selfsigned-ca.crt

#creacion de la clave privada

openssl genrsa -out selfsigned.key 2048

#Cree la CSR del servidor Apache:

openssl req -new -key selfsigned.key -out selfsigned.csr

#Firma de la CSR del servidor Apache :

openssl x509 -req -in selfsigned.csr -CA selfsigned-ca.crt -CAkey selfsigned-ca.key -set_serial 100 -days 365 -outform PEM -out selfsigned.crt



