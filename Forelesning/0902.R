x_verdiene = 0:8
y_verdiene = dbinom(x_verdiene, 8, 0.4)
plot(x_verdiene, y_verdiene)
plot(x_verdiene, y_verdiene, type = "h")
plot(x_verdiene, y_verdiene, type = "h", col="maroon")
plot(x_verdiene, y_verdiene, type = "h", col="maroon", lwd=3)

#Skal finne P(K_+8 = 3)
(p3 = dbinom(3,8,0.4)) # P(K_+8 = 3)
lines(3,p3,type = "h", col="blue", lwd=3)
»«⅝÷‰¼‰⅝÷«»°¿¬¬¬½>¾<<  »  
#Skal finne P(k_+8 ( <= )  <<<<>>>>>½½½}}°°¡@£$½¥{[]}±´¨~πœ→↓←þ®€ł@ªß3)
(p3 = pbinom(3,8,0.4)) # P(K_+8 = 3)
plot(x_verdiene, y_verdiene, type = "h", col="maroon", lwd=3)
x_special=0:3
Y_special=dbinom(x_special, 8,0.4)
lines(x_special, Y_special, type = "h", col="blue", lwd=3)

x = 1:150
y = pgamma(150,100,0.529)
line(x,y)

