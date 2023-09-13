library(readr)
library(ggplot2)
library(factoextra)
library(ISLR2)
library(tidyverse)
library(GGally)

# Análisis de delitos -----------------------------------------------------

ggpairs(USArrests,
                diag = list(continuous = wrap("barDiag",
                                              bins = 7,
                                              fill = "gray50")))
                

# Análisis de Componentes Principales -------------------------------------

pr.out2 <- prcomp(USArrests,scale = TRUE) # estandarizamos los datos
pr.out2

fviz_screeplot(pr.out2,
               addlabels = TRUE, ylim = c(0, 70)) +
  labs(title = "Scree plot") +
  theme_minimal()

fviz_pca_ind(pr.out2)
fviz_pca_ind(pr.out2,col.ind="contrib")
fviz_pca_var(pr.out2) # variables

fviz_pca_biplot(pr.out2)
fviz_pca_biplot(pr.out2, label ="var")
fviz_pca_biplot(pr.out2,col.ind=USArrests$UrbanPop)
fviz_pca_biplot(pr.out2,col.ind=USArrests$UrbanPop) +
  scale_color_gradient2(low="white", mid="gray",
                        high="gray30", midpoint=50)

fviz_pca_biplot(pr.out2,col.ind=USArrests$Rape) +
  scale_color_gradient2(low="white", mid="gray30",
                        high="gray10", midpoint=50)


fviz_pca_biplot(pr.out2,col.ind=USArrests$Assault) +
  scale_color_gradient2(low="white", mid="gray",
                        high="gray20", midpoint=50)

pr.out2

# Análisis de tipos de cáncer ---------------------------------------------

data(NCI60)
?NCI60

nci.labs <- NCI60$labs
nci.data <- NCI60$data

nci.data %>% View
nci.labs

# Análisis de Componentes Principales -------------------------------------

pr.out <- prcomp(nci.data,scale = TRUE)
pr.out %>% summary

fviz_screeplot(pr.out, addlabels = TRUE, ylim = c(0, 12)) +
  labs(title = "Scree plot") +
  theme_minimal()

fviz_pca_ind(pr.out)
fviz_pca_ind(pr.out,col.ind="contrib")

fviz_pca_var(pr.out) # > 6800 variables (no es factible)
fviz_pca_biplot(pr.out) # > 6800 variables (no es factible)

df1 <- data.frame(pr.out$x,nci.labs)
# pr.out$x son las componentes principales
df1 %>% head

ggplot(df1) + geom_point(aes(x = PC1,y = PC2,col = nci.labs))


library(plotly)
attach(df1)
plot_ly(x=PC1, y=PC2, z=PC3, type="scatter3d",
        mode="markers",color=nci.labs)


# Datos del titanic -------------------------------------------------------

data <- read_csv("Datasets/titanic.csv")

# Paso 3: Transforma las variables categóricas en numéricas
data_transformed <- data %>%
  mutate(Survived = factor(Survived,labels = c("No","Yes")),
         Sex = factor(Sex,labels = c("Female","Male")),
         Pclass = factor(Pclass)) %>%
  mutate(across(where(is.character), as.factor)) %>%
  mutate(across(where(is.factor), as.numeric)) %>% 
  dplyr::select(Survived,Pclass,Sex,Age,SibSp,Parch,Fare,Embarked) %>% 
  filter(complete.cases(.))

# Realizamos el Análisis de Componentes Principales (PCA)
res.pca <- prcomp(x = data_transformed %>% dplyr::select(-Survived),
                  center = TRUE,
                  scale. = TRUE)

# Grafico de sedimentación (Scree plot)
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))

# Gráfico de biplot con nombres de variables en las flechas
fviz_pca_var(res.pca, col.var="contrib", 
             gradient.cols = c("#00AFBB", "#E7B800"), 
             repel = TRUE) 

# Grafico de biplot
fviz_pca_biplot(res.pca, label = "var",
                habillage = data_transformed$Survived, 
                palette = c("#00AFBB", "#E7B800"),
                title = "Biplot - PCA",col.var = "gray30")
