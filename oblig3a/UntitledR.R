library(extraDistr)
#B0=SS0, B1=SS1
# Prior
k0=0
S0=0
v0=-1
SS0=0
C0=0
# Observasjoner
n=8
Sx=31832
SSx=82818

#----------------------------------------------#
# Posterior
k1 = k0 + n
S1 = S0 + Sx
v1 = v0 + n
SSx_2=SSx+Sx^2/n
C1=C0+SSx_2
m1=S1/k1
SS1=SS0+SSx
s1_2=SS1/v1
s1=sqrt(s1_2)
k=v1/2
#-------------------------------------------------------#

z=4000
s=100
#v1/2, #SS1/2
#----------------------------------------------------------#
# tau1=γ(v1/2, SS1/2)(t)
# mu1=t(m1,s1*sqrt(1/k1),v1)(x)
# X+=t(k*m1, s1*sqrt(1+(1/k1), v1))(x)
paste("Regn sannsynligheten for P( σ <",s,")")

(1-pgamma(1/s^2, v1/2, SS1/2))*100

#Vi skal finne theta, (tau=1/theta²).

paste("Regn sannsynligheten for P( µ <",z,")")

pt.scaled(z,v1,m1,s1*sqrt(1/k1))*100


paste("Regn sannsynligheten for P( X+ <",z,")")

pt.scaled(z,v1,m1,s1*sqrt(1+(1/k1)))*100


