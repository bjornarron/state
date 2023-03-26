library(datasets)
bæsj=discoveries
bæsj
#Histogram
k=12
hist(discoveries,breaks=k,ylab = "Hvor mange år som hadde den oppdagelsesraten",
     xlab = "antall oppdagelser i året", probability = TRUE, ylim = c(0,1))
k0=0
tau0=0


#Etter 3 år
t=3
n=sum(discoveries[1:3])
k1=k0+n
tau1=tau0+t
x=seq(0,5,0.001)
y1=dgamma(x, k1, tau1)
plot(x,y1, type='l',col="maroon")


#Neste 22 år. Totalt 25 år
n=sum(discoveries[4:25])
t=22
k2=k1+n
tau2=tau1+t
y2=dgamma(x, k2, tau2)
plot(x,y2, type='l',col="blue")


#Neste 75 år. Totalt 100 år
n=sum(discoveries[26:100])
t=75
k3=k2+n
tau3=tau2+t
y3=dgamma(x, k3, tau3)
plot(x,y3, type='l',col="pink")




hist(discoveries,breaks=k,ylab = "Hvor mange år som hadde den oppdagelsesraten",
     xlab = "antall oppdagelser i året", probability = TRUE, ylim = c(0,2))
lines(x,y1, type='l',col="maroon", ylim = c(0,3))
lines(x,y2, type='l',col="blue")
lines(x,y3, type='l',col="pink")

# Finne P(X=5)
X = 2
tau3/(tau3-X)
x10 = round(dnbinom(5,k3,tau3/(tau3+2))*100, 4)

paste("P (X=5) over to år vil dæ være ", x10, "%")


