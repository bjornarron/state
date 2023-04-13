library(extraDistr)
p=0.349
b0=0.5
a0=0.5

x = seq(0,1,0.001)
y= dbeta(x, a0, b0)

#n1
n1 = 10
k1n1 = rbinom(1, n1, p)
l1n1 = n1 - k1n1
a1n1 = a0 + k1n1
b1n1 = b0 + l1n1
y1 = dbeta(x, a1n1, b1n1)
plot1=plot(x,y1,type="l")
y105= qbeta(0.05, a1n1, b1n1)
y195= qbeta(0.95, a1n1, b1n1)
abline(v=y105,col="maroon",lwd=1)
abline(v=y195,col="maroon",lwd=1)

#n2
n2 = 100
k1n2 = rbinom(1, n2, p)
l1n2 = n2 - k1n2
a1n2 = a0 + k1n2
b1n2 = b0 + l1n2
y2 = dbeta(x, a1n2, b1n2)
plot2=plot(x,y2,type="l")
y205= qbeta(0.05, a1n2, b1n2)
y295= qbeta(0.95, a1n2, b1n2)
abline(v=y205,col="maroon",lwd=1)
abline(v=y295,col="maroon",lwd=1)

#n3
n3 = 1000
k1n3 = rbinom(1, n3, p)
l1n3 = n3 - k1n3
a1n3 = a0 + k1n3
b1n3 = b0 + l1n3
y3= dbeta(x, a1n3, b1n3)
plot3=plot(x,y3,type="l")
y305= qbeta(0.05, a1n3, b1n3)
y395= qbeta(0.95, a1n3, b1n3)
abline(v=y305,col="maroon",lwd=1)
abline(v=y395,col="maroon",lwd=1)

#n4
n4 = 10000
k1n4 = rbinom(1, n4, p)
l1n4 = n4 - k1n4
a1n4 = a0 + k1n4
b1n4 = b0 + l1n4
y4= dbeta(x, a1n4, b1n4)
y405= qbeta(0.05, a1n4, b1n4)
y495= qbeta(0.95, a1n4, b1n4)
plot4=plot(x,y4,type="l")
abline(v=y405,col="maroon",lwd=1)
abline(v=y495,col="maroon",lwd=1)

par(mfrow=c(2,2)) # set up 2x2 layout
plot(x,y1,type="l", main="n=10") 
abline(v=y105,col="maroon",lwd=1)
abline(v=y195,col="maroon",lwd=1)
plot(x,y2,type="l", main="n=100")
abline(v=y205,col="maroon",lwd=1)
abline(v=y295,col="maroon",lwd=1)
plot(x,y3,type="l", main="n=1000")
abline(v=y305,col="maroon",lwd=1)
abline(v=y395,col="maroon",lwd=1)
plot(x,y4,type="l", main="n=10000")
abline(v=y405,col="maroon",lwd=1)
abline(v=y495,col="maroon",lwd=1)


a <- 100
b <- 100
y <- dbeta(x, a, b)
plot(x, y, type = "l", xlab = "x", ylab = "Density", main = expression(paste("Beta(", a, ",", b, ") Distribution")))



a <- 100
b <- 100
y <- dbeta(x, a, b)
plot(x, y, type = "l", xlab = "x", ylab = "Density", main = expression(paste("Beta(", a, ",", b, ") Distribution")))

a100=a1n2
b100=b1n2
maxn2=(a100-1)/(a100+b100-2)
ep2=a100/(a100+b100)
median2=(a100-1/3)/(a100+b100-2/3)
y2n2= dbeta(x,a100,b100)
par(mfrow=c(1,2))
plot2_1=plot(x,y2n2,type="l",xlim = c(0.2,0.5))
abline(v=maxn2,col="maroon",lwd=1)
abline(v=ep2,col="green",lwd=1)
abline(v=median2,col="blue",lwd=1)
plot2_1=plot(x,y2n2,type="l", xlim = c(0.33,0.37))
abline(v=maxn2,col="maroon",lwd=1)
abline(v=ep2,col="green",lwd=1)
abline(v=median2,col="blue",lwd=1)

a10000=a1n4
b10000=b1n4
maxn4=(a10000-1)/(a10000+b10000-2)
ep4=a10000/(a10000+b10000)
median4=(a10000-1/3)/(a10000+b10000-2/3)
y2n4= dbeta(x,a10000,b10000)
plot4_1=plot(x,y2n4,type="l",xlim = c(0.2,0.5))
abline(v=maxn4,col="maroon",lwd=1)
abline(v=ep4,col="green",lwd=1)
abline(v=median4,col="blue",lwd=1)
plot4_1=plot(x,y2n4,type="l", xlim = c(0.35,0.351))
abline(v=maxn4,col="maroon",lwd=1)
abline(v=ep4,col="green",lwd=1)
abline(v=median4,col="blue",lwd=1)


alpfa=0.1
#1
p1=pbeta(0.5, a1n1, b1n1)
paste(p1,">",alpfa)
#2
p2=pbeta(0.5, a1n2, b1n2)
paste(p2,">",alpfa)

#3
p3=pbeta(0.5, a1n3, b1n3)
paste(p3,">",alpfa)

#4
p4=pbeta(0.5, a1n4, b1n4)
paste(p4,">",alpfa)

#Oppgave 5
a1=31.5
b1=69.5
A1=37.5
B1=63.5

mu1=a1/(a1+b1)
sigma1=(a1*b1)/((a1+b1)^2*(a1+b1+1))

mu2=A1/(A1+B1)
sigma2=(A1*B1)/((A1+B1)^2*(A1+B1+1))
sigma1+sigma2
b
sqrt(sigma1-sigma2)
pnorm(0,mu1-mu2,sqrt(sigma1+sigma2))

a=(a1/(a1+b1))-(A1/(A1+B1))
b=((a1*b1)/((a1+b1)^2*(a1+b1+1)))+((A1*B1)/((A1+B1)^2*(A1+B1+1)))
pnorm(0,a,sqrt(b))
A=(A1/(A1+B1))-(a1/(a1+b1))
B=((A1*B1)/((A1+B1)^2*(A1+B1+1)))+((a1*b1)/((a1+b1)^2*(a1+b1+1)))
pnorm(0,A,sqrt(B))
