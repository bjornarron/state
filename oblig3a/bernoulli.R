library(extraDistr)
p=0.349
b0=0.5
a0=0.5
  
x = seq(0,1,0.001)
y= dbeta(x, a0, b0)
plot(x,y,type="l")

#n1
n1 = 10
k1n1 = rbinom(1, n1, p)
l1n1 = n1 - k1n1
a1n1 = a0 + k1n1
b1n1 = b0 + l1n1
y1 = dbeta(x, a1n1, b1n1)
plot1=plot(x,y1,type="l")
epn1 = a1n1/(a1n1+b1n1)
opn1 = sqrt(a1n1*b1n1/(((a1n1+b1n1)^2)*(a1n1+b1n1+1)))
abline(v=epn1,col="green",lwd=1)
abline(v=epn1-opn1,col="pink",lwd=1)
abline(v=epn1+opn1,col="blue",lwd=1)

#n2
n2 = 100
k1n2 = rbinom(1, n2, p)
l1n2 = n2 - k1n2
a1n2 = a0 + k1n2
b1n2 = b0 + l1n2
y2 = dbeta(x, a1n2, b1n2)
plot2=plot(x,y2,type="l")
epn2 = a1n2/(a1n2+b1n2)
opn2 = sqrt(a1n2*b1n2/(((a1n2+b1n2)^2)*(a1n2+b1n2+1)))
abline(v=epn2,col="green",lwd=1)
abline(v=epn2-opn2,col="pink",lwd=1)
abline(v=epn2+opn2,col="blue",lwd=1)

#n3
n3 = 1000
k1n3 = rbinom(1, n3, p)
l1n3 = n3 - k1n3
a1n3 = a0 + k1n3
b1n3 = b0 + l1n3
y3= dbeta(x, a1n3, b1n3)
plot3=plot(x,y3,type="l")
epn3 = a1n3/(a1n3+b1n3)
opn3 = sqrt(a1n3*b1n3/(((a1n3+b1n3)^2)*(a1n3+b1n3+1)))
abline(v=epn3,col="green",lwd=1)
abline(v=epn3-opn3,col="pink",lwd=1)
abline(v=epn3+opn3,col="blue",lwd=1)
 
#n4
n4 = 10000
k1n4 = rbinom(1, n4, p)
l1n4 = n4 - k1n4
a1n4 = a0 + k1n4
b1n4 = b0 + l1n4
y4= dbeta(x, a1n4, b1n4)
plot4=plot(x,y4,type="l")
epn4 = a1n4/(a1n4+b1n4)
opn4 = sqrt(a1n4*b1n4/(((a1n4+b1n4)^2)*(a1n4+b1n4+1)))
abline(v=epn4,col="green",lwd=1)
abline(v=epn4-opn4,col="pink",lwd=1)
abline(v=epn4+opn4,col="blue",lwd=1)


#7
plot(x,y1, type='l',col="maroon", ylim = c(0,85))
lines(x,y2, type='l',col="blue")
lines(x,y3, type='l',col="pink")
lines(x,y4, type='l',col="orange")

#8
y1 = pbeta(x, a1n1, b1n1)
y2 = pbeta(x, a1n2, b1n2)
y3 = pbeta(x, a1n3, b1n3)
y4 = pbeta(x, a1n4, b1n4)
plot(x,y1, type='l',col="maroon", ylim = c(0,1))
lines(x,y2, type='l',col="blue")
lines(x,y3, type='l',col="pink")
lines(x,y4, type='l',col="orange")

if (!require(extraDistr)) {
  install.packages("extraDistr")
}
#9
suksess1 = dbbinom(2,5, a1n1, b1n1)
suksess2 = dbbinom(2,5, a1n2, b1n2)
suksess3 = dbbinom(2,5, a1n3, b1n3)
suksess4 = dbbinom(2,5, a1n4, b1n4)

#10
bom1 = dbnbinom(3,4,a1n1,b1n1)
bom2 = dbnbinom(3,4,a1n2,b1n2)
bom3 = dbnbinom(3,4,a1n3,b1n3)
bom4 = dbnbinom(3,4,a1n4,b1n4)
  
  
  
  
