

#cada linha de x tem um correspondente H
#para cada x eu sei a resposta dos neuronios da camada intermediaria!

#para eu fazer o H

#H eh a resposta de todos os neuronios para cada numero de entrada

rm(list = ls())

p<-20
N<-5
n<-4

#amostragem de dados
X<-matrix(runif(20), ncol = 4, nrow =5)

######
Z<-matrix(runif(20), ncol = p, dim(X))
 #(dimensao do vetor e retorna o vetor, numero de coluna)

U<-Z%*% X
H<-tanh(U)

W<-matrix(runif(n*p), ncol=m,nrow =p)

O<H%*%W
Y<-tanh(O)

View(Y)
