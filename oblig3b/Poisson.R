library(datasets)

k0=0
tau0=0
t=100
n=sum(discoveries)
k1=8
k2=67
k3=310
tau1=3
tau2=25
tau3=100
a1=0.4
a2=0.3
a3=0.2
a4=0.1
a5=0.05
a6=0.025
A1=qgamma(a1,k3,tau3)
B1=qgamma(1-a1,k3,tau3)
A2=qgamma(a2,k3,tau3)
B2=qgamma(1-a2,k3,tau3)
A3=qgamma(a3,k3,tau3)
B3=qgamma(1-a3,k3,tau3)
A4=qgamma(a4,k3,tau3)
B4=qgamma(1-a4,k3,tau3)
A5=qgamma(a5,k3,tau3)
B5=qgamma(1-a5,k3,tau3)
A6=qgamma(a6,k3,tau3)
B6=qgamma(1-a6,k3,tau3)

x=seq(0,5,0.001)
y3=dgamma(x, k3, tau3)
plot(x,y3, type='l',col="maroon",xlim = c(2.5,4))
grid()
segments(A1,0,A1,dgamma(A1,k3,tau3),col="red",lwd=1)
segments(B1,0,B1,dgamma(B1,k3,tau3),col="red",lwd=1)
segments(A2,0,A2,dgamma(A2,k3,tau3),col="orange",lwd=1)
segments(B2,0,B2,dgamma(B2,k3,tau3),col="orange",lwd=1)
segments(A3,0,A3,dgamma(A3,k3,tau3),col="yellow",lwd=1)
segments(B3,0,B3,dgamma(B3,k3,tau3),col="yellow",lwd=1)
segments(A4,0,A4,dgamma(A4,k3,tau3),col="green",lwd=1)
segments(B4,0,B4,dgamma(B4,k3,tau3),col="green",lwd=1)
segments(A5,0,A5,dgamma(A5,k3,tau3),col="blue",lwd=1)
segments(B5,0,B5,dgamma(B5,k3,tau3),col="blue",lwd=1)
segments(A6,0,A6,dgamma(A6,k3,tau3),col="purple",lwd=1)
segments(B6,0,B6,dgamma(B6,k3,tau3),col="purple",lwd=1)

k1
  k1/tau1
(k1-1)/tau1
qgamma(0.5,8,3)

pgamma(2.5,8,3)

pf(147/155,620,294)
