# Cómo trabajar con las ramas

## `git branch`

El comando `git branch` se utiliza en Git para trabajar con ramas (*branches*). Los *branches* son versiones paralelas de un repositorio que permiten desarrollar características o solucionar problemas de forma aislada sin afectar el *branch* principal (generalmente llamado "master" o "main").

A continuación, se muestran algunos usos comunes del comando `git branch`:

**Listar *branches:*** Para ver todas las ramas disponibles en tu repositorio, ejecuta el siguiente comando:

```bash
git branch
```

**Cambiar el nombre de un *branch:*** En Git, la opción `-M` en el comando git branch `-M` se utiliza para renombrar la rama actual.

Por lo tanto, si estás en el *branch* "master" y deseas cambiar su nombre a "main", puedes utilizar el siguiente comando:

```bash
git branch -M main
```

**Crear un nuevo *branch*:** Puedes crear un nuevo *branch* utilizando el siguiente comando:

```bash
git branch nombre_branch
```

Reemplaza "nombre_branch" con el nombre que deseas asignar al nuevo *branch*. El nuevo *branch* se creará en el punto actual del historial de *commits*.

**Eliminar un *branch*:** Si ya no necesitas un *branch*, puedes eliminarlo con el siguiente comando:

```bash
git branch -d nombre_rama
```

Ten en cuenta que no puedes eliminar el *branch* actual en el que te encuentras. Si deseas eliminar el *branch* actual, primero debes cambiar a otro *branch*.

¡Felicidades! Ya sabes usar Git y GitHub.
