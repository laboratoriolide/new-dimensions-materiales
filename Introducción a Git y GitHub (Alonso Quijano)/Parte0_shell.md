# El Shell

El Shell es un intérprete de comandos o aplicación que permite a los usuarios interactuar con el sistema operativo de una computadora y ejecutar comandos para realizar diversas tareas.

El Bash es el Shell más utilizado y se ejecuta en la mayoría de los sistemas operativos basados en Unix, incluidos Linux y macOS. Permite la automatización de tareas y la creación de secuencias de comandos para ejecutar varias operaciones de manera secuencial o condicional.

Los científicos de datos aprovechan el shell y el Bash en su flujo de trabajo para automatizar tareas repetitivas, gestionar entornos y dependencias, procesar grandes volúmenes de datos en lotes y crear pipelines de datos eficientes. Estas capacidades les permiten ahorrar tiempo y esfuerzo, mejorar la eficiencia y automatizar tareas complejas en su trabajo de análisis de datos.

## Comandos básicos de Shell

A continuación se presenta un instructivo de los comandos más básicos de Shell que un aspirante a científico de datos debería conocer:

1. `cd` (Change Directory): Cambia el directorio actual a uno especificado.
   - Uso: `cd ruta_del_directorio`
   - Ejemplo: `cd Documentos` (cambia al directorio "Documentos")

2. `pwd` (Print Working Directory): Muestra la ruta del directorio actual.
   - Uso: `pwd`
   - Ejemplo: `pwd` (muestra la ruta del directorio actual)

3. `mkdir` (Make Directory): Crea un nuevo directorio.
   - Uso: `mkdir nombre_del_directorio`
   - Ejemplo: `mkdir Proyecto` (crea un directorio llamado "Proyecto")

4. `rm` (Remove): Elimina un archivo o directorio.
   - Uso: `rm nombre_del_archivo` (para eliminar un archivo)
   - Uso: `rm -r nombre_del_directorio` (para eliminar un directorio y su contenido de forma recursiva)
   - Ejemplo: `rm archivo.txt` (elimina el archivo "archivo.txt")

5. `ls` (List): Lista los archivos y directorios en el directorio actual.
   - Uso: `ls`
   - Ejemplo: `ls` (muestra una lista de archivos y directorios en el directorio actual)

6. `cp` (Copy): Copia un archivo o directorio a una ubicación especificada.
   - Uso: `cp origen destino`
   - Ejemplo: `cp archivo.txt CarpetaDestino` (copia el archivo "archivo.txt" a la carpeta "CarpetaDestino")

7. `mv` (Move): Mueve un archivo o directorio a una ubicación especificada o cambia su nombre.
   - Uso: `mv origen destino`
   - Ejemplo: `mv archivo.txt NuevoNombre.txt` (cambia el nombre del archivo "archivo.txt" a "NuevoNombre.txt")

8. `echo`: Imprime un mensaje en la salida estándar.
   - Uso: `echo "mensaje"`
   - Ejemplo: `echo "Hola, mundo"` (imprime "Hola, mundo" en la salida estándar)
   - También podemos crear archivos. Por ejemplo: `echo "41,M,Yes,No,No,No,Often,Yes" >> mental_health_survey.csv`

9. `nano`: Editor de texto en la línea de comandos para crear y editar archivos.
   - Uso: `nano nombre_del_archivo`
   - Ejemplo: `nano archivo.txt` (abre el archivo "archivo.txt" en el editor `nano`)

10. `cat` (Concatenate): Muestra el contenido de un archivo en la salida estándar.
    - Uso: `cat nombre_del_archivo`
    - Ejemplo: `cat archivo.txt` (muestra el contenido del archivo "archivo.txt")

Recuerda que estos son solo algunos de los comandos más básicos de la shell, pero hay muchos más disponibles según tus necesidades específicas. Te recomiendo los cursos de DataCamp [Introduction to Shell](https://app.datacamp.com/learn/courses/introduction-to-shell) e [Introduction to Bash Scripting](https://app.datacamp.com/learn/courses/introduction-to-bash-scripting). ¡Buena suerte en tu camino como científico de datos!
