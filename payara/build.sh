#!/bin/bash

DOCKER_NOMBRE='progra3/payara'

# Construye la imagen con el nombre que esta en config/docker.conf
docker build -t $DOCKER_NOMBRE .

# Si se compilo la imagen, al final se muestra su nombre
if [ $? -eq 0 ]; then
	echo "**********************************************************"
	echo "**********************************************************"
	echo "Nombre del contenedor construido: "$DOCKER_NOMBRE
	echo "**********************************************************"
	echo "**********************************************************"
else
	exit -1
	
fi
