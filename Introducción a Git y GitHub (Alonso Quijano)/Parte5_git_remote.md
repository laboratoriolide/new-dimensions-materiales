# Cómo vincular un repositorio local con tu respositorio remoto en GitHub

## `git remote`

El comando `git remote` se utiliza para administrar las conexiones con repositorios remotos. Para vincular un repositorio local a un repositorio remoto utilizando Git debes seguir los siguientes pasos:

1\. Crea un repositorio remoto en GitHub.

2\. En Git Bash dirígete al directorio de tu repositorio local usando `cd`.

3\. Ejecuta el siguiente comando para agregar el repositorio remoto:

```bash
git remote add origin https://github.com/tu_usuario/mi_proyecto.git
```

4\. Renombra el *branch* principal (opcional pero recomendado):

Si el repositorio remoto utiliza "main" como el *branch* principal en lugar de "master" (la convención anterior), ejecuta el siguiente comando para renombrar tu *branch* principal a "main":

```bash
git branch -M main
```

5\. Envía los cambios locales al repositorio remoto:

Ejecuta el siguiente comando para enviar tus cambios locales al repositorio remoto:

```bash
git push -u origin main
```

Reemplaza "main" con el nombre de tu *branch* local si utilizas un nombre diferente.

¡Listo! Has vinculado con éxito tu repositorio local a un repositorio remoto en GitHub. Ahora puedes realizar operaciones de *push* y *pull* para mantener tus repositorios sincronizados.
