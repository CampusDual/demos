@echo off
for %%F in ("%~dp0.") do set "initial_dir=%%~fF"
echo ==== Detener app con docker compose (1/9) ====
wsl.exe docker compose down
echo ==== Crear carpeta temporal (2/9) ====
mkdir "%initial_dir%\temp"
cd "%initial_dir%\temp"
echo ==== Clonar repositorio (3/9) ====
git clone --single-branch --branch docker ...
echo ==== Limpiando imagenes antiguas (4/9) ====
wsl.exe docker image rm 202X-XXX-X-gX-db
wsl.exe docker image rm 202X-XXX-X-gX-backend
wsl.exe docker image rm 202X-XXX-X-gX-frontend
echo ==== Creando la imagen de la BBDD (5/9) ====
cd "%initial_dir%\temp\..."
wsl.exe docker build -t 202X-XXX-X-gX-db .
echo ==== Creando la imagen del backend (6/9) ====
cd "%initial_dir%\temp\..."
wsl.exe docker build -t 202X-XXX-X-gX-backend .
echo ==== Eliminando repositorios (7/9) ====
cd "%initial_dir%"
rmdir /s /q "temp"
echo ==== Lanzando docker compose (8/9) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (9/9) ====
wsl.exe docker compose logs -f