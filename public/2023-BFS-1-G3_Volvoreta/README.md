# Appmazing App
## Repositorio
* [Repositorio](https://github.com/CampusDual/2023-BFS-1-G3_Volvoreta)
## Base de datos
* Driver: `PostgreSQL`
* Host: `localhost`
* Puerto: `9054`
* Base de datos: ` `
* Usuario: ` `
* Contraseña: ` `
## Backend
* URL: [http://localhost:30070](http://localhost:30070)
* Usuario: `demo`
* Contraseña: `demo`
## Frontend
* URL: [http://localhost:4233](http://localhost:4233)

# Requisitos
* Docker (con WSL)
* Git

# Windows
## Iniciar aplicación (Sin imágenes docker)
```
appmazing-app> install.bat
```
## Iniciar aplicación (Con imagenes docker)
```
appmazing-app> wsl.exe docker compose up -d
appmazing-app> wsl.exe docker compose logs -f
```
## Parar la aplicación
```
appmazing-app> wsl.exe docker compose down
```

# WSL
## Iniciar aplicación (Sin imágenes docker)
```
appmazing-app$ chmod +x install.sh
appmazing-app$ ./install.sh
```
## Iniciar aplicación (Con imagenes docker)
```
appmazing-app$ docker compose up -d
appmazing-app$ docker compose logs -f
```
## Parar la aplicación
```
appmazing-app$ docker compose down
```