# Proyecto de Pruebas de API con Karate
Este proyecto implementa pruebas automatizadas para la API de Restful Booker utilizando el framework Karate. 
Se abordan los métodos HTTP GET, POST, PUT y DELETE para validar las funcionalidades de la API.


#Descripción
Este proyecto tiene como objetivo automatizar las pruebas de la API de Restful Booker, cubriendo las siguientes operaciones:

Autenticación: Generación de token de autenticación.
Operaciones CRUD: Creación, lectura, actualización y eliminación de reservas.

Referencias
Documentación de Karate
API de Restful Booker


## Notas y Consideraciones

- **Errores en Códigos de Estado de la API:**  
  Durante la ejecución de las pruebas, se ha detectado que en algunos escenarios la API de [Restful Booker](https://restful-booker.herokuapp.com/apidoc/index.html#api-Auth) devuelve códigos de estado distintos a los esperados. Por ejemplo:
  - En la modificacion de reservas (`PUT`), la API puede responder con un `405 OK` en lugar de un `404 Not Found`.
  - En Crear reserva (`POST`) con datos incorrectos, el código de estado esperado sería `400 Bad Request`, pero la API puede devolver ` 500 Internal Server Error` inesperadamente.

- Para evitar falsos negativos en las pruebas, se recomienda implementar validaciones flexibles en los casos donde la API tenga este comportamiento errático.
