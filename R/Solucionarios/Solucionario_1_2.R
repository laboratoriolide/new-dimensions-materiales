################### Solucionario #########################

# Práctica 1 ----

# tema 1
poker_gan <- c(150, 178, -6, 166, -80, -119, -142)

# tema 2
ruleta_gan<-c(-48,151,198,-16,134,-153,126)
dias <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(poker_gan) <- dias
print(poker_gan)

names(ruleta_gan)<-dias
print(ruleta_gan)

# tema 3
muestra_df <- data.frame(secuencia=seq(3,length=6),
                         aleatorio = rnorm(6),
                         letras = c("a", "b", "c", "d", "e","f"))
# tema 4
sales_hp <- c(497066400, 426630300, 401608200, 399302200, 377314200,
              359788300, 357233500, 328833900, 141823200, 189432500,
              142414700, 135197600, 99635700, 92756000, 134119300,
              138752100)

titles_hp <- c("1. HP and the Sorcerer's Stone",
               "8. HP and the Deathly Hallows Part 2",
               "4. HP and the Goblet of Fire",
               "2. HP and the Chamber of Secrets",
               "5. HP and the Order of the Phoenix",
               "6. HP and the Half-Blood Prince",
               "3. HP and the Prisoner of Azkaban",
               "7. HP and the Deathly Hallows Part 1")

potter<-data.frame(sales_hp,titles_hp)

dim(potter)  #verificando dimensión del objeto
nrow(sales_mat)  # verificando número de filas
ncol(sales_mat)  # verificando número de columnas

# Práctica 2 -----

# tema 1
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

new_df_carros<-df_carros %>% left_join(df_carros_2,by = c("MODELO"= "MODELO")) %>% view()


# tema 2
install.packages("datos")
library(datos)

#tema 3
#Calcula el atraso promedio por destino y luego une los datos en la data de 'aeropuertos'.
atraso_promedio_destino <- vuelos %>%
  group_by(destino) %>%
  # los vuelos con NA en atraso_llegada son vuelos cancelados
  summarise(atraso = mean(atraso_llegada, na.rm = TRUE)) %>%
  inner_join(aeropuertos, by = c(destino = "codigo_aeropuerto"))

#Finalmente agrega la ubicación de origen y destino (por ejemplo, latitud y longitud)
## al conjunto de datos 'vuelos'.

ubicacion_aeropuertos <- aeropuertos %>%
  select(codigo_aeropuerto, latitud, longitud)

vuelos %>%
  select(anio:dia, hora, origen, destino) %>%
  left_join(
    ubicacion_aeropuertos,
    by = c("origen" = "codigo_aeropuerto")
  ) %>%
  left_join(
    ubicacion_aeropuertos,
    by = c("destino" = "codigo_aeropuerto")
  )

# tema 4
destinos_populares <- vuelos %>%
  count(destino, sort = TRUE) %>%
  head(10)
vuelos %>%
  filter(destino %in% destinos_populares$destino)

vuelos %>%
  semi_join(destinos_populares)
