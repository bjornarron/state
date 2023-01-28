lengder = read.csv("terning.csv", sep=",")
lengder
data <- data.frame(lengder$lengde,lengder$hoyde)
minX = data$lengder.lengde
minY = data$lengder.hoyde
#Plotte alle punktenne
plot(minX, minY, ylim = c(5,30), ylab = "Høyde, cm", xlab = "Lengde, cm")
model <- lm(minY ~ minX)
#Plotte regresjonslinjen 
abline(model, col="red")
min_summary = summary(model)
model # Printer ut alpha og beta

alfa = min_summary$coefficients[1]
beta = min_summary$coefficients[2]
minPredY = alfa + minX * beta 

#Plotte orange linjesegmenter mellom punktene og regresjonslinja
segments(minX,minY,minX,minPredY,col="orange")
SSe = (length(data$lengder.lengde)-2)*min_summary$sigma^2
n = length(data$lengder.lengde)
SSe
s_e = sqrt((1/(n-2))*SSe)

var(data.frame(minX, minY))
# --------------------------------------------------------------------------------------------------------
# Her ville vi bare teste om vi kunne rekne med matrisene i R Studio. 
#Lager en matrise med alpha og beta = X
X = cbind(minX^0, minX)
#Printe ut matrise X
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
t(X) %*% minY

beta = solve(t(X) %*% X) %*% t(X) %*% minY
beta
t(X) %*% minY