rm(list = ls())

p<-20
N<-5
n<-4
m<-2
#amostragem de dados
X<-matrix(runif(N*n), ncol = n, nrow = N)

Y<-matrix(runif(N*m), ncol = m, nrow = N)
Z<-matrix(runif(n*p), ncol = p, nrow= 2)

# (dimensao do vetor e retorna o vetor, numero de coluna)

U<-Z%*%
H<-tanh(U)

W<-matrix(runif(n*p), ncol=m,nrow =p)

O<H%s*%W
Y<-tanh(O)


## erro
E<-Y-Yhat

View(Y)
