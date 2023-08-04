@echo off
echo ==== Detener app con docker compose (1/10) ====
wsl.exe docker compose down
echo ==== Crear carpeta temporal (2/10) ====
mkdir temp
cd temp
echo ==== Clonar repositorio para el backend (3/10) ====
git clone https://github.com/CampusDual/appmazing-back.git
echo ==== Clonar repositorio para el frontend (4/10) ====
git clone https://github.com/CampusDual/appmazing-front.git
echo ==== Limpiando imágenes antiguas (5/10) ====
wsl.exe docker image rm appmazingback
wsl.exe docker image rm appmazingfront
echo ==== Creando la imagen de backend (6/10) ====
cd appmazing-back
wsl.exe docker build -t appmazingback .
cd ..
echo ==== Creando la imagen de frontend (7/10) ====
cd appmazing-front
wsl.exe docker build -t appmazingfront .
cd ..
echo ==== Eliminando repositorios (8/10) ====
cd ..
rmdir /s /q "temp"
echo ==== Lanzando docker compose (9/10) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (10/10) ====
wsl.exe docker compose logs -f