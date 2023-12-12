#!/bin/bash
initial_dir=$(cd "$(dirname "$0")" && pwd)
echo "==== Detener app con docker compose (1/10) ===="
docker compose down
echo "==== Crear carpeta temporal (2/10) ===="
mkdir "$initial_dir/temp"
cd "$initial_dir/temp"
echo "==== Clonar repositorio para el backend (3/10) ===="
git clone https://github.com/CampusDual/appmazing-back.git
echo "==== Clonar repositorio para el frontend (4/10) ===="
git clone https://github.com/CampusDual/appmazing-front.git
echo "==== Limpiando imágenes antiguas (5/10) ===="
docker image rm appmazingback
docker image rm appmazingfront
echo "==== Creando la imagen de backend (6/10) ===="
cd "$initial_dir/temp/appmazing-back"
docker build -t appmazingback .
echo "==== Creando la imagen de frontend (7/10) ===="
cd "$initial_dir/temp/appmazing-front"
docker build -t appmazingfront .
echo "==== Eliminando repositorios (8/10) ===="
cd "$initial_dir"
rm -rf "temp"
echo "==== Lanzando docker compose (9/10) ===="
docker compose up -d
echo "==== Visualizando logs de docker compose (10/10) ===="
docker compose logs -f