

lengder = read.csv("terning.csv", sep=",")
lengder
data <- data.frame(lengder$lengde,lengder$hoyde)

plot(data$lengder.lengde, data$lengder.hoyde)
model <- lm(data$lengder.hoyde ~ data$lengder.lengde)
abline(model, col="red")
model
#Lager en matrise med alpha og beta = X
X = cbind(data$lengder.lengde^0, data$lengder.lengde)
#Matrise X
X
# Transponert Matrise X
t(X)

# Matrise X^t * X. 2x2 matrise
crossprod(X)
# Eller:
t(X)%*% X

#For å finne den inverse av X^t * X: (X^t * X)^-1
solve(t(X) %*% X)

#For å finne X^t * y(vektor):
t(X) %*% data$lengder.hoyde

beta = solve(t(X) %*% X) %*% t(X) %*% data$lengder.hoyde
beta
t(X) %*% data$lengder.hoyde
