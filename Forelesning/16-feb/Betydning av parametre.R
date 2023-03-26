par(mfrow=c(1,2))
n = 8

# Bernoli-prosess
p = 0.9

# Binomisk
x_forsøk = 0:n
y_sanns = dbinom(x_forsøk,n,p)
plot(x_forsøk, y_sanns, col="blue", type="h", lwd=3,main="Binomisk fordeling")

#Negativ Binomisk
k = 4 # Suksersser
x_fails = 0:10*k      #ceiling(2.5*k/p)
y_sanns =  dnbinom(x_fails,k,p)
plot(x_fails,y_sanns,col="maroon", type="h", lwd=3, main="Negativ Binomisk fordeling")


# Poisson-prosess
lamda = 0.9 #P(suksess)

# Poisson
T = 20 # ventetid
x_suksesser = 0:50
y_sanns = dpois(x_suksesser,T*lamda)
plot(x_suksesser, y_sanns, col="blue", type="h", lwd=3,main="Poisson fordeling")

#Gammafordeling
k = 8 # Suksersser
x_tid = seq(0,25,0.001)      #ceiling(2.5*k/p)
y_sanns =  dgamma(x_tid,k,lamda)
plot(x_tid,y_sanns,col="maroon", type="l", lwd=1, main="Gammafordeling")

#Normalfordeling
par(mfrow=c(1,1))
mu = 163.5
sigma = 67.2
x_verdier = seq(-50, 500, 0.1)
y_sanns = dnorm(x_verdier,mu,sigma)
plot(x_verdier,y_sanns,type = "l", col="blue")
qnorm(0.98, mu, sigma)
abline(v=mu,col="green")
abline(v=mu+c(-1,1)*sigma,col="pink")
abline(v=mu+c(-2,2)*sigma, col="red")

#









#
mu = 194.5
sigma = 80.1



