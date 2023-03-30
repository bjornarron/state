#Relavant pakker
install.packages("metRology")
library(metRology)      
library(extraDistr)

#Datasett og kule funksjoner
install.packages("MASS")
install.packages("car")
install.packages("alr4")
library(MASS)
library(car)
library(alr4)

#Se første 4 rader

head(Boston)
tail(Boston)
#Hva som faktorer inni boligverdien (medv)

scatterplot(Boston$indus,Boston$medv)
#plot(Boston$indus,Boston$medv)
scatterplotMatrix(Boston[,c(1,3,5,14)])
#Vil ha gram bare bare data hvor nox>0.7

Bostonnox = Boston[2,5-]
