# CarRental

1. Por medio de una plataforma web generar un contrato digital para el alquiler de autos.

2. Las partes que intervienen en el proceso o uso de la plataforma de emisión de contratos son:
a. Quien alquila el auto (propietario del auto). Debe llenar un formulario con datos del # Cedula, Tarjeta de propiedad, Licencia, correo, teléfono, dirección.
b. Quien toma el auto en alquiler (Usuario). Debe llenar un formulario con datos del # de cedula, correo, teléfono.
c. Y la empresa que presta el servicio a los dos anteriores (a y b), y es la dueña de la solución y debe guardar la información de (a y b).

3. El conductor cuando el usuario se sube:
a. Inicia la plataforma.
b. Ingresa los datos del usuario (# de cedula, correo, teléfono).
c. Ingresa los datos del viaje (tiempo, distancia y valor).
d. La plataforma procesa los datos y emite el contrato
e. La plataforma envía el contrato a los correos del conductor y usuario.

4. Modelo del contrato

NOTA:

1. debe crear un dasboard para la administración de los datos
2. hacer consumo de una api para que pueda estimar distancias y/o tiempos y dar un aproximado
3. si la solución es web, tener en cuenta que sea responsive
4. tener en cuenta que debe enviar email en el momento de generar los contratos, los contratos deben generarse al momento de iniciar el viaje y enviar email a las partes.
5 si hay un cambio en la ruta del viaje se debe generar un otro si para que se adjunte al contrato anterior

# Requisitos:

Los requisitos mínimos para ejecutar este proyecto son:

* Ruby version: 2.6.5

* Rails version: 5.2.4

* Servidor de base de datos: PostgreSql


Para inicializar este proyecto primero se deben configurar las variables de entorno en un archivo llamado `config/env_vars.yml`, de la siguiente manera:
development:
  EMAIL_SMTP_LOGIN: EMAIL_DE_LA_PLATAFORMA@DOMINIO.com
  EMAIL_SMTP_PASSWORD: 'CONTRASEÑA_DEL_EMAIL'
  EMAIL_DOMAIN: DOMINIO (EJ. gmail.com)
  EMAIL_SMTP_SERVER: SMTP (EJ. smtp.gmail.com)
  EMAIL_SMTP_PORT: 'PUERTO SMTP (587)'
  DATABASE_URL: 'postgres://USUARIO_BASE_DE_DATOS:CONTRASEÑA_USUARIO_BASE_DE_DATOS@SERVIDOR_O_IP_DE_LA_BASE_DE_DATOS:PUERTO_DEL_SERVIDOR_BASE_DE_DATOS/NOMBRE_BASE_DE_DATOS'
  DATABASE_NAME: 'NOMBRE_BASE_DE_DATOS'
  DATABASE_USER_NAME: 'NOMBRE_USUARIO_BASE_DE_DATOS' <-- ESTE USUARIO DEBE TENER PERMISOS DE CREAR BASE DE DATOS
  DATABASE_PASSWORD: 'CONTRASEÑA_DEL_USUARIO_DE_BASE_DE_DATOS'
  RAILS_MAX_THREADS: '5'
  HOST_DOMAIN: 'DOMINIO_DE_LA_PLATAFORMA'
  URL_ENVIRONMENT: URL_DE_LA_PLATAFORMA
  secret_token: 'TOKEN_GENERADO_POR_RAILS'
  secret_key_base: 'TOKEN_GENERADO_POR_RAILS'
production:
  EMAIL_SMTP_LOGIN: EMAIL_DE_LA_PLATAFORMA@DOMINIO.com
  EMAIL_SMTP_PASSWORD: 'CONTRASEÑA_DEL_EMAIL'
  EMAIL_DOMAIN: DOMINIO (EJ. gmail.com)
  EMAIL_SMTP_SERVER: SMTP (EJ. smtp.gmail.com)
  EMAIL_SMTP_PORT: 'PUERTO SMTP (587)'
  DATABASE_URL: 'postgres://USUARIO_BASE_DE_DATOS:CONTRASEÑA_USUARIO_BASE_DE_DATOS@SERVIDOR_O_IP_DE_LA_BASE_DE_DATOS:PUERTO_DEL_SERVIDOR_BASE_DE_DATOS/NOMBRE_BASE_DE_DATOS'
  DATABASE_NAME: 'NOMBRE_BASE_DE_DATOS'
  DATABASE_USER_NAME: 'NOMBRE_USUARIO_BASE_DE_DATOS' <-- ESTE USUARIO DEBE TENER PERMISOS DE CREAR BASE DE DATOS
  DATABASE_PASSWORD: 'CONTRASEÑA_DEL_USUARIO_DE_BASE_DE_DATOS'
  RAILS_MAX_THREADS: '5'
  HOST_DOMAIN: 'DOMINIO_DE_LA_PLATAFORMA'
  URL_ENVIRONMENT: URL_DE_LA_PLATAFORMA
  secret_token: 'TOKEN_GENERADO_POR_RAILS'
  secret_key_base: 'TOKEN_GENERADO_POR_RAILS'
test:
  EMAIL_SMTP_LOGIN: EMAIL_DE_LA_PLATAFORMA@DOMINIO.com
  EMAIL_SMTP_PASSWORD: 'CONTRASEÑA_DEL_EMAIL'
  EMAIL_DOMAIN: DOMINIO (EJ. gmail.com)
  EMAIL_SMTP_SERVER: SMTP (EJ. smtp.gmail.com)
  EMAIL_SMTP_PORT: 'PUERTO SMTP (587)'
  DATABASE_URL: 'postgres://USUARIO_BASE_DE_DATOS:CONTRASEÑA_USUARIO_BASE_DE_DATOS@SERVIDOR_O_IP_DE_LA_BASE_DE_DATOS:PUERTO_DEL_SERVIDOR_BASE_DE_DATOS/NOMBRE_BASE_DE_DATOS'
  DATABASE_NAME: 'NOMBRE_BASE_DE_DATOS'
  DATABASE_USER_NAME: 'NOMBRE_USUARIO_BASE_DE_DATOS' <-- ESTE USUARIO DEBE TENER PERMISOS DE CREAR BASE DE DATOS
  DATABASE_PASSWORD: 'CONTRASEÑA_DEL_USUARIO_DE_BASE_DE_DATOS'
  RAILS_MAX_THREADS: '5'
  HOST_DOMAIN: 'DOMINIO_DE_LA_PLATAFORMA'
  URL_ENVIRONMENT: URL_DE_LA_PLATAFORMA
  secret_token: 'TOKEN_GENERADO_POR_RAILS'
  secret_key_base: 'TOKEN_GENERADO_POR_RAILS'

# Instalación y ejecución del sistema

Después de configurar las variables de entorno se debe abrir una terminal para ejecutar comandos de línea (`CMD`, `Git Bash`, línea de omandos de linux o Mac ...), para ejecutar los siguientes comandos:

* Instalación de gemas:
```
Bundle install
```

* Creación de base de datos:
```
rails db:create
```

* Migración:
```
rails db:migrate
```

* Ejecutar seed para guardar informacióna a la base de datos:
```
rails db:seed
```

* Correr servidor:
```
rails s
```

* Correr servidor en un puerto especifico:
```
rails server --binding=0.0.0.0 -p PUERTO
rails server --binding=0.0.0.0 -p 3005
```


### Tecnologías usadas

La aplicación está estructurada utilizando
`Ruby On Rails`,`javascript`,`css 3`,`bootstrap 4` y `HTML5`.


# Plataforma en ejecución.

Inicialmente si se ejecuto `rails db:seed` se guardará información de "Tipo de Documento", "Grupo Sanguíneo" y un usuario con rol administrador:

### Información del usuario:

* email: admin@carrental.com
* password: 123456789

Con la información anteriormente dada se puede iniciar sesión en la plataforma, o si lo requiere puede registrar un nuevo usuario desde el formulario de registro, al crear un nuevo usuario la contraseña será el mismo número de doumento digitado.

### Roles del sistema

Los roles del sistema en funcionamiento son:
* Administrator: Este rol es el encargado de actualizar la parametrización de todo el sistema.
* Driver: Conductor, este usuario es el encargado de rellenar el formulario principal para generar el contato digital, al guardar la información el sistema enviará un correo al Conductor actualmente logueado y al usuario (pasajero), informando el monto a pagar con la respectiva información del viaje.