library(datasets)
discoveries
#Histogram
k=12
hist(discoveries,breaks=k,ylab = "Hvor mange år som hadde den oppdagelsesraten", xlab = "antall oppdagelser i året", probability = TRUE, ylim = c(0,1))
k0=0
tau0=0


#Etter 3 år
t=3
n=sum(discoveries[0:2])
k1=k0+n
tau1=tau0+t
x=seq(0,5,0.001)
y=dgamma(x, k1, tau1)
lines(x,y, type='l',col="maroon")


print(discoveries[0:25
              ])
#Neste 22 år. Totalt 25 år
n=sum(discoveries[1:25])
t=25
k2=k0+n
tau2=tau0+t
y=dgamma(x, k2, tau2)
lines(x,y, type='l',col="blue")


#Neste 75 år. Totalt 100 år
n=sum(discoveries)
t=100
k2=k0+n
tau2=tau0+t
y=dgamma(x, k2, tau2)
lines(x,y, type='l',col="pink")

