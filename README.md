# Senior PHP Developer Test

Prueba realizada en Lumen framework v8.0

Requerimientos:
- PHP >= 7.3
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension

###Pasos para configurar el proyecto:

1. Duplicar el archivo ".env.example" y renombrarlo a ".env".
2. Ejecutar database.sql para crear la Base de Datos (Estructura y Datos).
3. Configurar los parametros de conexión a la Base de Datos en el archivo ".env" (Línea 11 a 16).

###Pasos para ejecutar el proyecto:

1. Ubicarse en la carpeta del proyecto a través de la consola y ejecutar los comandos: 
    - composer update (para crear el vendor).
    - php -S localhost:8000 -t public (para levantar el servicio).
2. Abrir un navegador y ejecutar la siguiente url:  http://localhost:8000/thn_test/hotels/1 
3. Para probar consultar otros hoteles, se debe cambiar el parametro de la url. En caso de que el hotel no exista, se muestra una excepción.
4. Para motrar el resultado de la petición a la API sin renderizar a una vista, se debe ejecutar en el navegador el siguiente url: "http://localhost:8000/thn_test/api/hotels/1"

### Test Unitarios
1. Ubicarse en la carpeta del proyecto a través de la consola.
2. Para efectos de validar la petición he creado dos test:
    - testShouldReturnHotel: permite validar que la estructura del JSON retornado sea correcta
    - testShouldNotReturnHotel: permite validar cuando el ID de un hotel que se pasa por parametro, no existe.
3. Para ejecutar los tests, se debe ejecutar el siguiente comando: "vendor/bin/phpunit".