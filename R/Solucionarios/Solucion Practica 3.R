# Práctica 3-----
## Este código me permite:
## 1. Filtrar la base de datos original por Ecuador y Chile a partir del 29/02/20.
## 2. Ordenar los datos por fecha
## 3. Adicionar 5 variables (columnas) nuevas a la base de datos original: active, active_total, recovered_total, death_total, cum_cases.
## 4. Transformar la base, incrementando el número de columnas y disminuyendo el número de filas.
## 5. Graficar las distribuciones acumuladas de Chile y Ecuador por fecha.
#devtools::install_github("RamiKrispin/coronavirus")

library(coronavirus)
library(tidyverse)

coronavirus %>% select(date,country, type, cases) %>%
  filter(country %in% c("Ecuador","Chile"),date >= "2020-02-29") %>%
  group_by(type,country,date) %>%
  summarise(total_cases = sum(cases)) %>%
  pivot_wider(names_from = type, values_from = total_cases) %>% arrange(date) %>%
  mutate(active = confirmed - death - recovery,
         active_total = cumsum(active),
         recovered_total = cumsum(recovery),
         death_total = cumsum(death),
         cum_cases = cumsum(confirmed) ,
         n= rep(1:1105) ) %>%
  ggplot(.,aes(x=n,y=cum_cases))+geom_line(aes(color=country))+
  theme_minimal()+
  labs(title="Casos acumulados: Ecuador vs. Chile", x = "n", y = "Número de casos",color="País") +
  theme(plot.title = element_text(color="black", size=14, face="bold.italic"),panel.background = element_rect(fill = "white", colour = "#6D9EC1"))
