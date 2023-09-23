# Cómo mantener el repositorio local sincronizado con el repositorio remoto

## `git push`

Para mantener tus repositorios sincronizados, puedes utilizar las operaciones de *push* y *pull* en Git. El comando `git push` se utiliza para enviar los cambios de tu repositorio local al repositorio remoto. Esto permite que otros colaboradores del proyecto vean y accedan a tus cambios. Los *commits* y los *branches* que hayas creado en tu repositorio local se envían al repositorio remoto.

### Uso básico:

1\. Asegúrate de haber realizado y confirmado tus cambios locales utilizando git commit.

2\. En Git Bash, dentro del directorio de tu repositorio local, ejecuta el comando `git push` seguido del nombre del repositorio remoto y el *branch* que deseas enviar. Por ejemplo:

```bash
git push origin main
```

**Nota importante:** Si es la primera vez que realizas un push en esta rama, agrega la opción `-u`:

```bash
git push -u origin main
```

## `git pull`

El comando `pull` se utiliza para obtener y fusionar los cambios del repositorio remoto en tu repositorio local. Básicamente, realiza dos operaciones en conjunto: primero, recupera (*fetch*) los cambios del repositorio remoto y luego los fusiona (*merge*) con tu rama local. Esto asegura que tu rama local esté actualizada con los cambios más recientes del repositorio remoto.

### Uso básico:

En tu terminal, dentro del directorio de tu repositorio local, ejecuta el comando `git pull` seguido del nombre del repositorio remoto y el branch que deseas actualizar. Por ejemplo:

```bash
git pull origin main
```

Git realizará un *pull* para traer los cambios más recientes del repositorio remoto a tu repositorio local. Si hay conflictos entre los cambios locales y los cambios remotos, Git te guiará para resolver los conflictos.

Es importante tener en cuenta que antes de realizar un *push* o *pull*, siempre es recomendable hacer un `git status` para verificar el estado actual de tu repositorio y asegurarte de que no haya conflictos pendientes o cambios sin *commit*.
