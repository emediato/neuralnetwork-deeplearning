rm(list=ls())
#  perceptron eh uma lista
# retorno do perceptron
N<-100

xc1<-matrix(rnorm(2*N),  ncol = 2)+2

xc2<-matrix(rnorm(2*N),  ncol = 2)+6

plot(xc2[,1], xc2[,2], col='red', xlim=c(0,10), ylim=c(0,10))
par(new=T)
plot(xc1[,1], xc1[,2], col='blue', xlim=c(0,10), ylim=c(0,10))


# row bind = bind por linha
xall<-rbind(xc1,xc2)
# gera duas colunas, n importa classe
yall<-rbind(matrix(0,ncol=1,nrow=N),matrix(1,ncol=1,nrow=N))

linear_classification_2var()


