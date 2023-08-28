@echo off
for %%F in ("%~dp0.") do set "initial_dir=%%~fF"
echo ==== Detener app con docker compose (1/10) ====
wsl.exe docker compose down
echo ==== Crear carpeta temporal (2/10) ====
mkdir "%initial_dir%\temp"
cd "%initial_dir%\temp"
echo ==== Clonar repositorio (3/10) ====
git clone --single-branch --branch docker ...
echo ==== Limpiando imagenes antiguas (4/10) ====
wsl.exe docker image rm 202X-XXX-X-gX-db
wsl.exe docker image rm 202X-XXX-X-gX-backend
wsl.exe docker image rm 202X-XXX-X-gX-frontend
echo ==== Creando la imagen de la BBDD (5/10) ====
cd "%initial_dir%\temp\..."
wsl.exe docker build -t 202X-XXX-X-gX-db .
echo ==== Creando la imagen del backend (6/10) ====
cd "%initial_dir%\temp\..."
wsl.exe docker build -t 202X-XXX-X-gX-backend .
echo ==== Creando la imagen del frontend (7/10) ====
cd "%initial_dir%\temp\..."
wsl.exe docker build -t 202X-XXX-X-gX-frontend .
echo ==== Eliminando repositorios (8/10) ====
cd "%initial_dir%"
rmdir /s /q "temp"
echo ==== Lanzando docker compose (9/10) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (10/10) ====
wsl.exe docker compose logs -f