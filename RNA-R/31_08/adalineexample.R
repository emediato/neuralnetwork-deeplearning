

rm(list = ls())

N<-5
n<-4

###amostragem
X<-matrix(runif(N*n), ncol = n, nrow = N)
X<-cbind(1, X)
Y<-matrix(runif(N), ncol = 1, nrow = N)
H<-tanh(U)
W<-matrix(runif(n=1), ncol = 1, nrow = n)

O<-H%*%W
Yhat<-tanh(O)

E<-Y-Yhat

#N = dados!!!!!!!!!!!