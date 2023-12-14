@echo off
for %%F in ("%~dp0.") do set "initial_dir=%%~fF"
echo ==== Detener app con docker compose (1/10) ====
wsl.exe docker compose down
echo ==== Crear carpeta temporal (2/10) ====
mkdir "%initial_dir%\temp"
cd "%initial_dir%\temp"
echo ==== Clonar repositorio (3/10) ====
git clone --single-branch --branch docker https://github.com/CampusDual/2022-MND-1-G4_AsociacionHostelerosACoruna
echo ==== Limpiando imagenes antiguas (4/10) ====
wsl.exe docker image rm 2022-mnd-1-g4-db
wsl.exe docker image rm 2022-mnd-1-g4-backend
wsl.exe docker image rm 2022-mnd-1-g4-frontend
echo ==== Creando la imagen de la BBDD (5/10) ====
cd "%initial_dir%\temp\2022-MND-1-G4_AsociacionHostelerosACoruna\demo-backend\src\main\resources\db"
wsl.exe docker build -t 2022-mnd-1-g4-db .
echo ==== Creando la imagen del backend (6/10) ====
cd "%initial_dir%\temp\2022-MND-1-G4_AsociacionHostelerosACoruna\demo-backend"
wsl.exe docker build -t 2022-mnd-1-g4-backend .
echo ==== Creando la imagen del frontend (7/10) ====
cd "%initial_dir%\temp\2022-MND-1-G4_AsociacionHostelerosACoruna\demo-frontend"
wsl.exe docker build -t 2022-mnd-1-g4-frontend .
echo ==== Eliminando repositorios (8/10) ====
cd "%initial_dir%"
rmdir /s /q "temp"
echo ==== Lanzando docker compose (9/10) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (10/10) ====
wsl.exe docker compose logs -f