library('plot3D')
source('trainperceptron.R')
source('')
s1<-0.4
s2<-0.4
nc<-200
xc1<-matrix((rnorm(nc*2), ncol=2)*s1 + t(matrix((c(2,2), ncol=nc,nrow=2))))
xc2<-matrix((rnorm(nc*2), ncol=2)*s1 + t(matrix((c(4,4), ncol=nc,nrow=2))))

plot(X[1:60,1],X[1:60,2],type='p',col='red', xlim = c(0,6),xlab= 'x_1', ylab='x_2')
par(new=T)
plot(xc2[,1],xc2[,2],col='blue', xlim = c(0,6),xlab= '', ylab='')


p<-100 # numero colunas
# suaviza a superficie de plot p<-10 IDEAL
# definir a complexidade define o treinamento.


Z<-replicate(p,runif(3,-0.5,0.5))


Xaug<-cbind(1,X)
H<-tanh(Xaug %*% Z)

# pseu inverse
lambda<-0.0000001 # conseguir resolver inversa
W<-solve(t(H)%*% + lambda*diag(p))%*%t(H)) %*%
Yhat_train<-sign(H %*% W)
e_train<-sum((Y-Yhat_train)^2)/4
print(e_train)

Xaug_t<-cbind(1,X_t)
H_t<-tanh(Xaug_t %*% Z)
Yhat_t<-sign(H_t %*% W)
e_t <- sum((Y-Yhat_t)^2)/4
print(e_t)

seqx1x2<-seq(-2,10,0.1)
lseq

MZ
cr<-0

for(i in 1:lseq){
  for(j in 1:lseq){
  cr<-cr+1
  x1<-seqx1x1
}
}

x1_reta<-seq(6/100,6,6/100)
x2_reta<- -x1_reta+6
par(new=T)
plot(x1_reta,x2_reta, type='l',col='orange', xlim=c(0,6))