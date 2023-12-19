#!/bin/bash
initial_dir=$(cd "$(dirname "$0")" && pwd)
echo "==== Detener app con docker compose (1/10) ===="
docker compose down
echo "==== Crear carpeta temporal (2/10) ===="
mkdir "$initial_dir/temp"
cd "$initial_dir/temp"
echo "==== Clonar repositorio (3/10) ===="
git clone --single-branch --branch docker https://github.com/CampusDual/2022-MND-1-G3_MountainClothing
echo "==== Limpiando imagenes antiguas (4/10) ===="
docker image rm 2022-mnd-1-g3-db
docker image rm 2022-mnd-1-g3-backend
docker image rm 2022-mnd-1-g3-frontend
echo "==== Creando la imagen de la BBDD (5/10) ===="
cd "$initial_dir/temp/2022-MND-1-G3_MountainClothing/demo-backend/src/main/resources/db"
docker build -t 2022-mnd-1-g3-db .
echo "==== Creando la imagen del backend (6/10) ===="
cd "$initial_dir/temp/2022-MND-1-G3_MountainClothing/demo-backend"
docker build -t 2022-mnd-1-g3-backend .
echo "==== Creando la imagen del frontend (7/10) ===="
cd "$initial_dir/temp/2022-MND-1-G3_MountainClothing/demo-frontend"
docker build -t 2022-mnd-1-g3-frontend .
echo "==== Eliminando repositorios (8/10) ===="
cd "$initial_dir"
rm -rf "temp"
echo "==== Lanzando docker compose (9/10) ===="
docker compose up -d
echo "==== Visualizando logs de docker compose (10/10) ===="
docker compose logs -f