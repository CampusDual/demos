# Appmazing App
## Repositorios
* [Backend](https://github.com/CampusDual/appmazing-back)
* [Frontend](https://github.com/CampusDual/appmazing-front)
## Base de datos
* Driver: `HSQL`
* Host: `localhost`
* Puerto: `9013`
* Base de datos: `templateDB`
* Usuario: `SA`
* Contraseña: ` `
## Backend
* URL: [http://localhost:30030](http://localhost:30030)
* Usuario: `demo`
* Contraseña: `demo`
## Frontend
* URL: [http://localhost:4200](http://localhost:4200)

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
