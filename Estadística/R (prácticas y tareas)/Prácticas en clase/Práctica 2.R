library(ISLR2)
names(Auto)
head(Auto)

# regresi√≥n lineal simple
mfrm0 = lm(mpg ~ acceleration,
          data = Auto)

mfrm0

library(ggplot2)
ggplot(data = Auto,
       mapping = aes(x = acceleration,y = mpg)) +
  geom_point() + 
  geom_smooth(method = lm) +
  xlim(0,25) + ylim(0,50)



summary(mfrm0)

# lm = linear model

mfrm = lm(mpg ~ acceleration + horsepower + 
     cylinders + weight,
   data = Auto)

summary(mfrm)

# Modelo reducido
msrm = lm(mpg ~ horsepower + weight,data = Auto)
summary(msrm)

msrm2 = lm(mpg ~ horsepower + weightTON,data = Auto)
summary(msrm2)

ggplot(data = Auto,
       mapping = aes(x = horsepower,y = mpg)) +
  geom_point() + 
  geom_smooth(method = lm)

ggplot(data = Auto,
       mapping = aes(x = horsepower,y = mpg)) +
  geom_point() + 
  geom_smooth(method = lm,formula = y ~ poly(x,2))

library(moments)
jarque.test(msrm2$residuals)

plot(msrm2)

summary(lm(mpg ~ horsepower,data = Auto))
summary(lm(mpg ~ horsepower + I(horsepower^2),data = Auto))

ggplot(data = Auto,
       mapping = aes(x = horsepower,y = mpg)) +
  geom_point() + 
  geom_smooth()


# Otro conjunto de datos --------------------------------------------------

library(ISLR2)
library(GGally)

ggpairs(Boston)
ggpairs(Boston,columns = 8:13)

attach(Boston)

ggplot(Boston) + 
  geom_point(aes(x = lstat,y = medv)) +
  geom_smooth(aes(x = lstat,y = medv),
              method = "lm",
              formula = "y ~ poly(x,2)")

mod1 <- lm(medv ~ lstat,data = Boston)
mod2 <- lm(medv ~ lstat + I(lstat^2),data = Boston)

library(tidyverse)
Boston %>% select(lstat,medv)

df_pred <- data.frame(lstat = c(5,10,15,20,25,30))
df_pred$predict1 <- predict(object = mod1,newdata = df_pred)
df_pred$predict2 <- predict(object = mod2,newdata = df_pred)
View(df_pred)

mod5 <- lm(medv ~ poly(lstat,5),data = Boston) # polinomio de orden 5
mod10 <- lm(medv ~ poly(lstat,10),data = Boston)

summary(mod1)
summary(mod2)
summary(mod5)
summary(mod10)

AIC(mod1,mod2,mod5,mod10) # a menor AIC mejor el modelo

ggplot(Boston) + 
  geom_point(aes(x = lstat,y = medv)) +
  geom_smooth(aes(x = lstat,y = medv),
              method = "lm",
              formula = "y ~ poly(x,2)")

ggplot(Boston) + 
  geom_point(aes(x = lstat,y = medv)) +
  geom_smooth(aes(x = lstat,y = medv),
              method = "lm",
              formula = "y ~ poly(x,5)")
#
ggplot(Boston) + 
  geom_point(aes(x = lstat,y = medv)) +
  geom_smooth(aes(x = lstat,y = medv),
              method = "lm",
              formula = "y ~ poly(x,10)")

# modelo completo

names(Boston)

modfull <- lm(medv ~ ., data = Boston)
summary(modfull)

modfull1 <- lm(medv ~ . - indus, data = Boston)
summary(modfull1)

modfull2 <- lm(medv ~ . - indus - age, data = Boston)
summary(modfull2)


# SelecciÛn autom·tica de variables ---------------------------------------

library(MASS)

modfull <- lm(medv ~ . + I(lstat^2), data = Boston)
summary(modfull)

modelo_opt <- stepAIC(object = modfull)

summary(modelo_opt)
AIC(mod1,mod2,mod5,mod10,
    modfull,modfull1,modfull2,modelo_opt)

pos <- sample(1:nrow(Boston),10)
Boston_muestra <- Boston[pos,]

Boston_muestra$pred <- predict(object = modelo_opt,Boston_muestra)

Boston_muestra %>% dplyr::select(medv,pred)

ggplot(Boston_muestra) + 
  geom_point(aes(x = pred,y = medv)) + 
  geom_abline(slope = 1)
