# El estado actual del repositorio

## `git status`

El comando `git status` muestra el estado actual del repositorio de Git. Proporciona información sobre los cambios realizados en el directorio de trabajo y el área de preparación (*staging area*).

### Uso básico:

```bash
git status
```

Este comando muestra una descripción clara y concisa del estado actual del repositorio. Indica si hay archivos modificados, eliminados, nuevos o sin seguimiento, y también proporciona instrucciones sobre qué acciones se pueden tomar para actualizar el repositorio.

Ejemplo de salida de `git status`:

```
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)

        modified:   index.html

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        newfile.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

En este ejemplo, git status muestra que el archivo `index.html` ha sido modificado pero no se ha agregado para confirmar los cambios. Además, hay un archivo nuevo llamado `newfile.txt` que aún no se ha agregado al área de preparación.

Recuerda que tanto `git log` como `git status` son comandos muy útiles para obtener información sobre el historial de confirmaciones y el estado actual del repositorio de Git. Puedes utilizar estos comandos regularmente para mantener un seguimiento de los cambios realizados en tu proyecto y tomar decisiones adecuadas en función de esa información.

# El historial de *commits*

## `git log`

El comando `git log` se utiliza para ver el historial de *commits* en un repositorio de Git. Proporciona información detallada sobre los commits realizados, como el autor, la fecha, el mensaje y el identificador único de cada commit.

A continuación, se explican los elementos clave que se muestran en la salida del comando `git log`:

- Hash del commit: Es una cadena alfanumérica única que identifica de forma exclusiva cada *commit*.
- Autor: Nombre y dirección de correo electrónico del autor que realizó el commit.
- Fecha: Fecha y hora en la que se realizó el commit.
- Mensaje: Descripción breve y significativa del *commit* que proporciona información sobre los cambios realizados.

### Uso básico:

```bash
git log
```

Este comando muestra una lista de commits en orden cronológico inverso, es decir, desde el *commit* más reciente hasta el más antiguo. La salida incluye detalles como el autor, la fecha, el mensaje y el *hash* del *commit*.

### Ejemplo de salida de `git log`:

```
commit 8ef5f7a6c3d8398a31b13a2d4bc327ae6348a12d
Author: John Doe <johndoe@example.com>
Date:   Mon Jun 14 15:27:52 2023 +0000

    Added new feature XYZ

commit b6f12d55fe67b8a81bce18e3e1e1676f964e44c9
Author: Jane Smith <janesmith@example.com>
Date:   Fri Jun 10 09:42:17 2023 +0000

    Updated documentation

commit 92c392f367d1f29c7d584976a3f5b019864f2b12
Author: John Doe <johndoe@example.com>
Date:   Wed Jun 08 18:09:35 2023 +0000

    Initial commit
```

### Cómo referirse al historial un *commit* específico

Para ver el historial detallado de un *commit*, ejecuta el siguiente comando reemplazando "HASH" con el hash del *commit*:

```hash
git log HASH
```

En Git, para referirte a un *commit* específico utilizando su hash, generalmente solo necesitas especificar los primeros caracteres del hash que sean suficientes para identificar de manera única ese *commit*. Por lo general, se recomienda utilizar al menos 7-8 caracteres iniciales para una identificación segura del *commit*.