df_carros <- data.frame(
  MODELO= rownames(mtcars),
  TRANSMISION= ifelse(mtcars$am == 0, "automatica", "manual"),
  NUM_CILINDROS= mtcars$cyl,
  MPG= mtcars$mpg,
  CABALLOS_FUERZA= mtcars$hp
)

df_carros_2 <- data.frame(
  MODELO= rownames(mtcars[3:20, ]),
  PESO= mtcars$cyl[3:20],
  N_CARBU= mtcars$carb[3:20]
)

## UNO) Mediante las funciones de tidyverse y usando los dataframes
## de líneas anteriores
## incluye el Peso y el Número
## de carburadores de los autos en 'df_carros


## DOS)  Instala y carga el paquete 'datos'

## TRES) Con los conjuntos de datos contenidos en el
## paquete instalado en DOS. Calcula el atraso promedio por destino
## y luego une los datos en la data de 'aeropuertos'.
## Finalmente agrega la ubicación de origen y destino (por ejemplo, latitud y longitud)
## al conjunto de datos 'vuelos'.

## CUATRO) Encuentra los 10 destinos más populares
## para posteriormente encontrar cada vuelo que fue a alguno de esos 10 destinos.

## Realiza un semi_join() entre el objeto 'vuelos' y
## el objeto que contenga los 10 destinos más populares.
## Comenta qué información se ha obtenido con este filtering join
