# Configuración del repositorio de Git local

## `git init`

El comando `git init` se utiliza para iniciar un repositorio local de Git en un directorio específico. Al ejecutar este comando, se crea una nueva instancia de repositorio en ese directorio, que permite realizar el seguimiento de cambios, realizar *commits* y realizar otras operaciones de control de versiones utilizando Git.

Cuando se ejecuta `git init`, se crea una carpeta oculta llamada ".git" en el directorio actual. Esta carpeta contiene todos los archivos y registros necesarios para el funcionamiento interno de Git y para controlar los cambios en el repositorio.

Es importante tener en cuenta que `git init` solo se ejecuta una vez en un directorio para iniciar el repositorio. Después de la inicialización, puedes utilizar otros comandos de Git, como `git add`, `git commit`, `git branch`, etc., para administrar y trabajar con el repositorio.

## Cómo configurar el repositorio

A continuación se presentan los pasos para configurar un repositorio de Git local en tu escritorio de Windows utilizando Git Bash:

1\. Abre Git Bash en tu escritorio de Windows.

2\. Crea la carpeta donde deseas crear tu repositorio. Puedes utilizar el comando `mkdir` seguido del nombre de la carpeta. Por ejemplo:

```bash
mkdir Mis Documentos/nuevo_proyecto
```
Esto creará una nueva carpeta llamada "nuevo_proyecto" en el directorio actual. 

Recuerda que para revisar cuál es tu directorio actual en Git Bash, puedes utilizar el comando `pwd`. Al ejecutarlo te mostrará la ruta completa del directorio en el que te encuentras actualmente.

3\. Especifica el directorio actual utilizando el comando `cd` seguido del nombre de la carpeta. Por ejemplo:

```bash
cd Mis Documentos/nombre_proyecto
```

4\. Inicia el repositorio ejecutando el siguiente comando:

```bash
git init
```

Para verificar si se ha creado la carpeta .git, que está oculta en sistemas operativos como Windows, puedes utilizar el siguiente comando:  

```bash
ls -a
```  
El comando `ls` se utiliza para listar el contenido de un directorio, y el argumento `-a` muestra todos los archivos, incluidos los archivos ocultos.
