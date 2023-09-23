library(ggplot2)

# 1. Quieres evaluar si la proporción de envíos médicos tardíos en 
# tu compañía es menor que el estándar aceptable del 5%. ¿Qué proporción de envíos son tardíos?


tardios <- c(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, # 1 = tarde, 0 = a tiempo
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

mean(tardios)

datos <- data.frame(estado = factor(tardios,
                                    levels = c(0, 1),
                                    labels = c("No Tardío", "Tardío")))

ggplot(datos, aes(x = estado)) +
  geom_bar(aes(y = after_stat(prop), group = 1), fill = c("#F8766D", "#00BA38")) +
  theme_minimal() +
  labs(title = "Distribución Relativa de Tardíos y No Tardíos", y = "Frecuencia Relativa", x = "Estado") +
  scale_y_continuous(labels = scales::percent_format(scale = 100))

?prop.test

# proportion test
prop.test(x = sum(tardios),n = length(tardios),p = 0.05,alternative = "less")

# Como el valor p es menor que 0.05, rechazamos H0
# Por lo tanto, existe evidencia que apunta a que efectivamente
# nuestra proporción de ocasiones dónde tenemos envíos tardíos de
# medicamentos es menor que el 5%.


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# 2. Estás comparando el tiempo medio de resolución de tickets entre dos equipos de soporte técnico.

# ¿Cuál equipo tiene un tiempo promedio de resolución más bajo?

equipo1 <- rnorm(100, mean=35, sd=8)  
equipo2 <- rnorm(100, mean=30, sd=7)
t.test(x = equipo1,y = equipo2) # no existe diferencias Vs. sí existen >:()
# p-value = 0.002008 -> Sí son significativamente diferentes las medias entre ambos equipos

mean(equipo1);mean(equipo2) # el equipo 2 resuelve más rápido

# Verifiquemos
# H0: son iguales los tiempos medios Vs. H1: el equipo 2 resulve más rápido
# H0: mu1 = mu2 Vs. H1: mu1 > mu2
# H0: mu1 - mu2 = 0 Vs. H1: mu1 - mu2 > 0
t.test(x = equipo1,y = equipo2,alternative = "greater",mu = 0)
# Una vez más rechazamos H cero y por lo tanto, comprobamos que el equipo dos 
# resuelve más rápido en promedio.

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# 3. Quieres evaluar si la duración de visualización de un video varía entre tres grupos diferentes.

# ¿Qué grupo tiene la mayor duración promedio de visualización?

grupo1 <- rnorm(50, mean=10, sd=2)  
grupo2 <- rnorm(50, mean=11, sd=3)
grupo3 <- rnorm(50, mean=9, sd=1.5)

datos <- data.frame(
  valor = c(grupo1, grupo2, grupo3),
  grupo = factor(rep(1:3, each=50),
                 labels=c("Grupo 1", "Grupo 2", "Grupo 3"))
)

ggplot(datos, aes(x=grupo, y=valor, fill=grupo)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Diagrama de Cajas Comparativo", y = "Valor", x = "Grupo") +
  scale_fill_manual(values=c("#F8766D", "#00BA38", "#619CFF"))

# No puedo suponer varianzas iguales
# Por lo tanto, no podemos utilizar una prueba ANOVA
# Como somos cautelosos procedemos con una prueba no paramétrica.

kruskal.test(list(grupo1, grupo2, grupo3))

# H0: No existen dif sig entre los 3 grupos
# H1: Al menos 1 par de grupos son significativamente diferentes.

# Valor p pequeño < 0.05 -> Rechazamos H0

# Como el tamaño de muestra es grande (> 30) puedo usar la prueba t
# La prueba T en no necesita asumir varianzas iguales
t.test(x = grupo2,y = grupo3)

# Valor p pequeño < 0.05 -> Rechazamos H0
# Por lo tanto, el tiempo visualización medio entre el grupo dos y 3 son significativamente diferentes.
# demora más el grupo el grupo 2.


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# 4. Estás comparando los ingresos medios de dos grupos diferentes de trabajadores.

# ¿Qué grupo tiene un ingreso promedio más alto?

trabajadores1 <- rnorm(150, mean=2500, sd=300)  
trabajadores2 <- rnorm(150, mean=2300, sd=280)

datos <- data.frame(
  salario = c(trabajadores1, trabajadores2),
  grupo = factor(rep(1:2, each=150), labels=c("Trabajadores 1", "Trabajadores 2"))
)

ggplot(datos, aes(x=salario, fill=grupo)) +
  geom_histogram(position="identity", alpha=0.5, bins=30) +
  theme_minimal() +
  labs(title = "Distribución de Salarios", y = "Frecuencia", x = "Salario") +
  scale_fill_manual(values=c("#F8766D", "#00BA38"))

ggplot(datos, aes(x=grupo, y=salario, fill=grupo)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribución de Salarios", y = "Salario", x = "Grupo") +
  scale_fill_manual(values=c("#F8766D", "#00BA38"))

?t.test

# 5. Deseas saber si el puntaje promedio de satisfacción del usuario para tu producto 

# es diferente de un valor objetivo de 7. ¿Es el puntaje promedio significativamente diferente?

puntuaciones <- rnorm(200, mean=6.8, sd=1.5)

hist(puntuaciones)
mean(puntuaciones)

t.test(x = puntuaciones,mu=7,alternative = "two.sided")
# p-value = 0.846 >> 0.10 _> No rechazamos H0
# Por lo tanto, no existe evidencia estadística para decidir de que el 
# nivel de satisfacción promedio es diferente de 7


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# 6. Estás analizando si el número observado de ventas en tres categorías difiere de lo esperado.

# ¿Hay una diferencia significativa entre las ventas observadas y las esperadas?

# Bondad de ajuste Chi-cuadrada

observado <- c(320, 280, 400)
esperado <- c(330, 290, 380)
chisq.test(observado, p=esperado/sum(esperado))

# valor p >> 0.1 -> No rechazamos H0 (que dice que no existe diferencias entre los obs y esp)
# Por lo tanto, podemos concluir que hemos vendido lo que se esperaba en las 3 categorías


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------


# 7. Un investigador desea determinar si la proporción de programadores en una muestra es 

# significativamente mayor que el 50%. ¿La proporción es mayor que el 50%?

programadores <- c(rep(1, 540), rep(0, 460))  
prop.test(sum(programadores), length(programadores), p=0.50, alternative="greater")

# 8. Quieres saber si hay una relación entre el género de un individuo y su elección de carrera.
# ¿Existe una asociación entre género y elección de carrera?


tabla <- matrix(c(120, 80, 100, 110, 90, 100), nrow=2)
colnames(tabla) = c("Carrera 1","Carrera 2","Carrera 3")
rownames(tabla) = c("Masculino","Femenino")
tabla

chisq.test(tabla)
# H0: ambos factores son independientes vs. H1: NO son independientes
# Valor p < 0.05 -> Rechazamos H0
# Por lo tanto, podemos concluir que la elección de carrera no es independiente del género del estudiante.

# 9. Deseas comparar la cantidad de clics que reciben dos anuncios diferentes en tu sitio web.

# ¿Qué anuncio recibe más clics en promedio?

anuncio1 <- c(5, 4, 5, 6, 4, 5, 7, 5, 6, 6)
anuncio2 <- c(5, 6, 5, 7, 5, 5, 6, 7, 7, 6)
wilcox.test(anuncio1, anuncio2)

# 10. Los datos que tienes no cumplen con las suposiciones de normalidad y deseas comparar 

# las puntuaciones medias de dos grupos. ¿Qué grupo tiene una puntuación promedio más alta?

grupoA <- c(5, 5, 5, 6, 6, 5, 5, 6, 5)
grupoB <- c(6, 6, 7, 7, 6, 6, 7, 6, 6)
wilcox.test(grupoA, grupoB)

# 11. Quieres comparar la calificación media en un examen entre tres grupos de estudiantes 

# que fueron enseñados con diferentes métodos. ¿Qué método resultó en la calificación promedio más alta?

metodo1 <- rnorm(40, mean=75, sd=10)
metodo2 <- rnorm(40, mean=80, sd=10)
metodo3 <- rnorm(40, mean=78, sd=10)

df <- data.frame(
  Calificacion = c(metodo1, metodo2, metodo3),
  Metodo = factor(rep(1:3, each=40))
)

ggplot(df, aes(x=Metodo, y=Calificacion)) +
  geom_boxplot(aes(fill=Metodo)) + 
  labs(title="Diagrama de Cajas Comparativo de los Tres Métodos", 
       x="Método", 
       y="Calificación") + 
  theme_minimal()

# Ejecutar ANOVA
aov_res <- aov(Calificacion ~ Metodo, data=df)
summary(aov_res)


# 13. Estás interesado en determinar si la proporción de clientes que compran el Producto A 

# es diferente de la proporción de clientes que compran el Producto B. ¿Cuál producto es preferido?

productoA <- sample(c(rep(1, 490), rep(0, 510)))
productoB <- sample(c(rep(1, 510), rep(0, 490)))

prop.test(x = c(sum(productoA), sum(productoB)),
          n = c(length(productoA), length(productoB)))
