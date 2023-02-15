rm(list=ls())

library('corpcor')
library('RMThreshold')


fgx<-function(xin) 0.5*xin^2+3*xin+10 # funcao Fg(x)


X<-runif(n=100, min=-15,max=10) #20amostras uniformemente distribuidas entre -15 e +10
#library RMThreshold
Y<- fgx(X) + 20*rnorm(length(X))

# #row-bind vectors together into matrix
# my_matrix <- rbind(vector1, vector2, vector3)


H<-cbind(X,1) # matrix generation
# uma vez obtidos os dados vou plotas os dados
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(H) %*% Y

xgrid <- seq(-15, 10, 0.1) #intervalo de 0.1 para xgrid
ygrid<-(0.5*xgrid^2+3*xgrid+10)

#projetar xgrid na camada intermediaria :
Hgrid <- cbind(xgrid,1)
yhatgrid<- Hgrid %*% w

plot(X,Y)
#par(new=TRUE)
lines(xgrid,ygrid, type='l', col='red')
#par(new=TRUE)
lines(xgrid,yhatgrid, 'l')

# ----------- 
# aproximacao de grau 2
H<-cbind(X^2,X,1) # matrix generation grau 2
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y

Hgrid<-cbind(xgrid^2, xgrid, 1)

yhatgrid<- Hgrid %*% w

plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')

# ----------- 
# aproximacao de grau 3
H<-cbind(X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')

# ----------- 
# aproximacao de grau 4
H<-cbind(X^4,X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^4,xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')


# ----------- 
# aproximacao de grau 5
H<-cbind(X^5,X^4,X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^5,xgrid^4,xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')

# ----------- 
# aproximacao de grau 6
H<-cbind(X^6,X^5,X^4,X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^6,xgrid^5,xgrid^4,xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')

# ----------- 
# aproximacao de grau 7
H<-cbind(X^7,X^6,X^5,X^4,X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^7,xgrid^6,xgrid^5,xgrid^4,xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')
# ----------- 
# aproximacao de grau 8
H<-cbind(X^8,X^7,X^6,X^5,X^4,X^3,X^2,X,1) # matrix generation
Hgrid<-cbind(xgrid^8,xgrid^7,xgrid^6,xgrid^5,xgrid^4,xgrid^3,xgrid^2, xgrid, 1)
noisyH.matrix <-add.Gaussian.noise(H, mean=0, stddev = 4, symm = FALSE)
w<-pseudoinverse(noisyH.matrix) %*% Y
yhatgrid<- Hgrid %*% w
plot(X,Y)
lines(xgrid,ygrid, type='l', col='red')
lines(xgrid,yhatgrid, 'l')
