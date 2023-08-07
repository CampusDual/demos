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
* Docker compose (v2)
* Git

# Windows
## Iniciar aplicación
```
appmazing-app> run_app.bat
```
## Parar la aplicación 
```
appmazing-app> wsl.exe docker compose down
```

# WSL
## Iniciar aplicación
```
appmazing-app$ chmod +x run_app.sh
appmazing-app$ ./run_app.sh
```
## Parar la aplicación
```
appmazing-app$ docker compose down
```
