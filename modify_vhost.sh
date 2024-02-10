#!/bin/bash

# Define la ruta del archivo de configuración del virtual host
VHOST_FILE="/etc/apache2/sites-available/000-default.conf"

# Contenido que quieres agregar o modificar
NEW_CONTENT="
<VirtualHost *:80>
    ServerName docker.gercol22
    DocumentRoot /usr/src/app/web

    <Directory /usr/src/app>
        Require all granted
        AllowOverride all
    </Directory>

    Include /usr/src/app/config-dev/vhost.conf
</VirtualHost>
"

# Reemplaza el contenido del archivo de configuración con el nuevo contenido
echo "$NEW_CONTENT" > "$VHOST_FILE"