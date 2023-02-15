rm(list=ls())
library('corpcor') # calculo da pseudo inversa
fgx<-function(xin) 0.5*xin^2+3*xin+10 # funcao Fg(x)
# f_g = 1/2 x^2 + ...
# fncao geradora


X<-runif(n=20, min=-15,max=10) #20amostras uniformemente distribuidas entre -15 e +10
Y<- fgx(X) + 10*rnorm(length(X))


H<-cbind(X^2,X,1)
# # polinomio de grau dois
# colna de dois lados
w<-pseudoinverse(H) %*% Y

# uma vez obtidos os dados vou plotas os dados

xgrid <- seq(-15, 10, 0.1) #intervalo de 0.1 para xgrid
ygrid<-(0.5*xgrid^2+3*xgrid+10)

#projetar xgrid na camada intermediaria :
Hgrid <- cbind(xgrid^2,xgrid,1)
yhatgrid<- Hgrid %*% w

plot(xgrid, yhatgrid)


plot(X,Y)
#par(new=TRUE)
lines(xgrid,ygrid, type='l', col='red')
#par(new=TRUE)
lines(xgrid,yhatgrid, 'l')
