# Analisis de Directorio de Compañías
# New Dimensions 2023

# Preliminares ------------------------------------------------------------

# Directorio de trabajo

# Cargar librerias

library(dplyr)
library(lubridate)
library(readxl)
library(tidyr)

# Importar la base como se descarga de la SUPERCIAS, manejando adecuadamente las filas que
# no se utilizan para el analisis

directorio_raw <-
  read_excel("C:/Users/user/OneDrive/Documentos/trabajo/LIDE/Tableau/directorio_companias.xlsx",
             skip = 4)  %>% 
  janitor::clean_names()

# Cambiar el path del archivo al relevante en su computadora si desean ejecutar el codigo

# Preparar base -----------------------------------------------------------

# Fechas

df <-
  directorio_raw %>%
  mutate(fecha_limpia = as.Date(fecha_constitucion, format = "%d/%m/%Y"))
  
# Aplicar filtro de empresas activas

df <-
  df  %>% 
  filter(situacion_legal == "ACTIVA")

# Análisis ----------------------------------------------------------------

# Pregunta 6. En que mes del año se constituyen más empresas? 

# Crear variable mes

df <-
  df  %>% 
  mutate(mes = month(fecha_limpia, label = TRUE))

# Crear tabla de frecuencias

df  %>% 
  group_by(mes)  %>% 
  summarise(n = n())  %>% 
  arrange(desc(n))

# En agosto se han creado en total mas empresas que en cualquier otro mes. Pero en promedio?

# Agrupamos por año mes

df_my <-
  df  %>% 
  group_by(year(fecha_limpia), mes)  %>% 
  summarise(n = n())  %>% 
  arrange(desc(n))  %>% 
  rename(año = `year(fecha_limpia)`)

# Reshape para que cada año sea una columna

df_reshape <-
  df_my  %>% 
  pivot_wider(names_from = año, values_from = n)

# Tomar promedio de cada mes

df_reshape_my <-
  df_reshape  %>% 
  mutate(promedio = rowMeans(.[2:5]))  %>% 
  arrange(desc(promedio))

# Agosto es el mes en donde se constituyen mas empresas en promedio

# Pregunta 7. Cuales son los CIIU y provincias con mayor cantidad de empresas en promedio (cada mes)?

# Crear mes-año y facilitar nombre ciiu

df <-
  df  %>% 
  mutate(mes_año = paste(mes, year(fecha_limpia), sep = "-"))  %>% 
  rename(ciiu = 'ciiu_nivel_1')

# CIIU

# Agrupamos por mes año y ciiu

df_ciiu <-
  df %>% 
  group_by(ciiu, mes_año)  %>% 
  summarise(n = n())  %>% 
  arrange(desc(n))

# Reshape para que cada mes año sea una columna

df_reshape_ciiu <-
  df_ciiu  %>% 
  pivot_wider(names_from = mes_año, values_from = n)

# Tomar promedio para cada ciiu a lo largo de columnas

df_reshape_ciiu <-
  df_reshape_ciiu  %>%
  ungroup() %>%
  mutate(promedio = rowMeans(.[2:61], na.rm =))  %>%
  arrange(desc(promedio))

# El CIIU G 4511 (Comercio al por mayor y menor) es el que tiene mayor promedio de empresas

# Provincias

# Agrupamos por mes año y provincia

df_prov <-
  df %>% 
  group_by(provincia, mes_año)  %>% 
  summarise(n = n())  %>% 
  arrange(desc(n))

# Reshape para que cada mes año sea una columna

df_reshape_prov <-
  df_prov  %>% 
  pivot_wider(names_from = mes_año, values_from = n)

# Tomar promedio para cada provincia a lo largo de columnas

df_reshape_prov <-
  df_reshape_prov  %>%
  ungroup() %>%
  mutate(promedio = rowMeans(.[2:61], na.rm =))  %>%
  arrange(desc(promedio))

# Guayas y Picnchincha son las provincias con mayor promedio de empresas

