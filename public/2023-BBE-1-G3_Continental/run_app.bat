@echo off
for %%F in ("%~dp0.") do set "initial_dir=%%~fF"
echo ==== Detener app con docker compose (1/9) ====
wsl.exe docker compose down
@REM echo ==== Crear carpeta temporal (2/9) ====
@REM mkdir "%initial_dir%\temp"
@REM cd "%initial_dir%\temp"
@REM echo ==== Clonar repositorio (3/9) ====
@REM git clone --single-branch --branch docker https://github.com/CampusDual/2023-BBE-1-G3_Continental.git
echo ==== Limpiando imagenes antiguas (4/9) ====
wsl.exe docker image rm 2023-bbe-1-g3-db
wsl.exe docker image rm 2023-bbe-1-g3-backend
echo ==== Creando la imagen de la BBDD (5/9) ====
cd "%initial_dir%\temp\2023-BBE-1-G3_Continental\Continental-model\src\main\db"
wsl.exe docker build -t 2023-bbe-1-g3-db .
echo ==== Creando la imagen del backend (6/9) ====
cd "%initial_dir%\temp\2023-BBE-1-G3_Continental"
wsl.exe docker build -t 2023-bbe-1-g3-backend .
@REM echo ==== Eliminando repositorios (7/9) ====
@REM cd "%initial_dir%"
@REM rmdir /s /q "temp"
echo ==== Lanzando docker compose (8/9) ====
wsl.exe docker compose up -d
echo ==== Visualizando logs de docker compose (9/9) ====
wsl.exe docker compose logs -f