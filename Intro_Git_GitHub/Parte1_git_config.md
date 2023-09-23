# Configuración de las credenciales

## `git config`

El comando `git config` se utiliza para configurar y mostrar las opciones de configuración de Git en tu sistema. A través de este comando, puedes establecer diversas configuraciones que afectan el comportamiento y la apariencia de Git, así como ver las configuraciones existentes.

## Nombre de usuario y dirección de correo electrónico

Antes de poder utilizar Git, es imporante configurar tu nombre de usuario y dirección de correo electrónico. Esta información de identificación que se asociará con tus *commits* y otras operaciones en Git. Esto es importante porque permite a otros colaboradores y herramientas de Git reconocer quién realizó cada cambio en el repositorio.

del nombre de usuario y dirección de correo electrónico

Al ejecutar los comandos siguientes en Git Bash o en el terminal que estés usando:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu_email@ejemplo.com"
```

Estás estableciendo la configuración global de Git en tu sistema. La opción `--global` asegura que estos valores se apliquen de manera global para todos tus repositorios de Git en esa máquina. Si omites --global, se configurará solo para el repositorio actual.

Reemplaza "Tu Nombre" con tu nombre de usuario real que deseas utilizar en tus commits de Git. Puede ser tu nombre completo o un alias, según tus preferencias.

Reemplaza "tu_email@ejemplo.com" con la dirección de correo electrónico asociada a tu cuenta de GitHub. Es importante usar la misma dirección de correo electrónico que utilizaste para registrarte en GitHub o para identificar tu cuenta en el servicio Git remoto que estés utilizando. Esto asegurará que tus commits se asocien correctamente con tu cuenta.

**Nota importante:** Estos comandos de configuración se ejecutan una sola vez, generalmente al configurar Git por primera vez en tu máquina. Una vez configurados, Git utilizará estos valores de manera predeterminada para tus futuros commits en todos los repositorios de Git que utilices en tu computadora.

## PAT (Personal Access Token)

La configuración y el almacenamiento del PAT de GitHub en Git son necesarios para permitir que Git se autentique automáticamente al interactuar con repositorios remotos en GitHub.

Para establecer la conexión con GitHub y configurar tu PAT:

1\. Genera un PAT en GitHub.

2\. Configura Git para usar el PAT. En Git Bash, ejecuta el siguiente comando:

```bash
git config --global credential.helper store
```

Esto configura Git para almacenar de forma segura tus credenciales para acceder a repositorios remotos. Al ejecutar este comando, Git guarda tus credenciales en un archivo encriptado y las recuerda para futuras sesiones.

3\. A continuación, ejecuta el siguiente comando para agregar el PAT a la configuración de Git:

```bash
git config --global user.password PAT
```

Reemplaza "PAT" con el token que copiaste de GitHub.

Ejecuta el siguiente comando para verificar que la configuración se haya guardado correctamente:

```bash
git config user.password
```