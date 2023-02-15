rm(list=ls())
library('plot3D')

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


# como os pesos estao relacionados a reta???
# vetor de pesos corresponde a reta!!!
# a partir dos pesos eu obtenho as retas

seqx1x2<-seq(0,10,0.2)
npgrid<-length(seqx1x2)

M<-matrix(nrow=npgrid, ncol=npgrid)
ci<-0

# entrada fixa corresponde ao peso fixo tambem!

# vetor pesos w_0, w_1 e w_2 : [10 1 1]
#
# w_0  = 10 ... w_0 corresponde ao termo de polarizacoa
# separador linear correspondente a estes valores de pesos
# possui equacao x2=-x1+10

# EQ DECISAO
# w_1 * x_1 + w_2 * x_2 = w_0
# ------------------
# y = A.x + B
#
# a = w_1/w_2
# b = w_0/w_2
w<-as.matrix(c(10,1,1))
for(x1 in seqx1x2){

  ci<-ci+1
  cj<-0
  for(x2 in seqx1x2){

    cj<-cj+1

    # no adaline usa-se 1 !!!!!
    xin<-as.matrix(c(-1,x1,x2)) # vetor
    w<-as.matrix(w) # vetor
  
    
    M[ci,cj]<-1.0*((t(xin) %*% w >= 0))
    # yperceptron(xin, c(1.5,1,1), 1)
    # para plotar reta
    # a reta eh uma razao !!
    # pega ponto inicial x_0=0, pega ponto y_0 e ve quanto vai dar
    # pega ponto final x_10, pega ponto y_10 e ve quanto vai dar
  }
}

ribbon3D(seqx1x2,seqx1x2,xlim=c(0,10), ylim=c(0,10), M, colkey=F)
scatter3D(xc1[,1], xc1[,2], matrix(0, nrow=dim(xc1)[1]), add=T, M='blue', colkey=F)
scatter3D(xc2[,1], xc2[,2], matrix(0, nrow=dim(xc1)[1]), add=T, col='red', colkey=F)


