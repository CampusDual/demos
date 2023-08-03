#!/bin/bash

echo "==== Crear carpeta temporal (1/8) ===="
mkdir temp
cd temp

echo "==== Clonar repositorio para el backend (2/8) ===="
git clone https://github.com/CampusDual/appmazing-back.git

echo "==== Clonar repositorio para el frontend (3/9) ===="
git clone https://github.com/CampusDual/appmazing-front.git

echo "==== Creando la imagen de backend (4/9) ===="
cd appmazing-back
docker build -t appmazingback .
cd ..

echo "==== Creando la imagen de frontend (5/9) ===="
cd appmazing-front
docker build -t appmazingfront .
cd ..

echo "==== Eliminando repositorios (6/9) ===="
cd ..
rm -r temp

echo "==== Lanzando docker compose (7/8) ===="
docker compose up -d

echo "==== Visualizando logs de docker compose (8/8) ===="
docker compose logs -f
