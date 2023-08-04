@echo off
echo ==== Detener app con docker compose (1/10) ====
wsl.exe docker compose down
echo ==== Crear carpeta temporal (2/10) ====
mkdir temp
cd temp
echo ==== Clonar repositorio (3/10) ====
git clone https://github.com/CampusDual/2023-BFS-1-G3_Volvoreta
echo ==== Limpiando imagenes antiguas (5/10) ====
wsl.exe docker image rm 2023-bfs-1-g3-db
echo ==== Creando la imagen de la BBDD (6/10) ====
cd 2023-BFS-1-G3_Volvoreta/Backend/Backend-model/src/main/db
wsl.exe docker build -t 2023-bfs-1-g3-db .
cd ..
echo ==== Eliminando repositorios (8/10) ====
cd ../../../../../..
rmdir /s /q "temp"
echo ==== Lanzando docker compose (9/10) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (10/10) ====
wsl.exe docker compose logs -f