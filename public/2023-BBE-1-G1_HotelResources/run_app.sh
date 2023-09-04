#!/bin/bash
initial_dir=$(cd "$(dirname "$0")" && pwd)
echo "==== Detener app con docker compose (1/9) ===="
docker compose down
echo "==== Crear carpeta temporal (2/9) ===="
mkdir "$initial_dir/temp"
cd "$initial_dir/temp"
echo "==== Clonar repositorio (3/9) ===="
git clone --single-branch --branch docker https://github.com/CampusDual/2023-BBE-1-G1_HotelResources
echo "==== Limpiando imagenes antiguas (4/9) ===="
docker image rm 2023-bbe-1-g1-db
docker image rm 2023-bbe-1-g1-backend
echo "==== Creando la imagen de la BBDD (5/9) ===="
cd "$initial_dir/temp/2023-BBE-1-G1_HotelResources/hr-model/src/main/db"
docker build -t 2023-bbe-1-g1-db .
echo "==== Creando la imagen del backend (6/9) ===="
cd "$initial_dir/temp/2023-BBE-1-G1_HotelResources"
docker build -t 2023-bbe-1-g1-backend .
echo "==== Eliminando repositorios (7/9) ===="
cd "$initial_dir"
rm -rf "temp"
echo "==== Lanzando docker compose (8/9) ===="
docker compose up -d
echo "==== Visualizando logs de docker compose (9/9) ===="
docker compose logs -f