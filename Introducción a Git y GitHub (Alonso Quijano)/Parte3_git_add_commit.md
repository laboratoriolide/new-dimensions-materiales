# Cómo guardar los cambios en un repositorio

## `git add`

Los comandos`git add` y `git commit` son dos comandos fundamentales en Git que se utilizan para realizar cambios y registrarlos en el historial de *commits* del repositorio.

`git add` se utiliza para agregar cambios al área de preparación (*staging area*) en Git. Los cambios pueden ser archivos modificados, nuevos o eliminados. Al agregar cambios con `git add`, estás seleccionando qué modificaciones deseas incluir en el próximo *commit*.

* Para agregar todos los archivos en la carpeta actual:

```bash
git add .
```

* Para agregar un archivo específico:

```bash
git add nombre_del_archivo
```

Nota: Para eliminar un archivo del área de preparación sin eliminarlo del directorio de trabajo, utiliza el comando `git rm --cached nombre_del_archivo`.

## `git commit`

`git commit` se utiliza para confirmar los cambios preparados en el área de preparación y guardarlos en el historial de confirmaciones del repositorio. Cada *commit* en Git tiene un mensaje descriptivo asociado que explica los cambios realizados.

Para realizar un commit, se utiliza el siguiente comando:

```bash
git commit -m "Descripción del cambio"
```

Reemplaza "Descripción del cambio" con un mensaje descriptivo que resuma los cambios realizados en el *commit*. Es recomendable utilizar mensajes claros y significativos para facilitar la comprensión de los cambios en el historial.