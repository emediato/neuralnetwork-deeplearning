rm(list=ls())

p<-10 # gerar dados aleatorios

Z<-replicate(p,runif(3,-0.5,0.5))

X<- matrix(runif(16), ncol=2)
Xaug<-cbind(1,X)

H<-tanh(Xaug %*% Z)

lambda<-0.0000001 # conseguir resolver inversa

# W<-solve(t(H) %*% H+lambda*diag(p)) %*% t(H) %*% Z 

#library RMThreshold
Y<- sign(H)

W<-solve(t(H) %*% H + lambda*diag(p))%*%t(H)%*%Y

Yhat_train<-sign(H %*% W)
e_train<-sum((Y-Yhat_train)^2)/4
print(e_train)
  


#H <- X%*%Z
#tanh(X%*%Z)
#W<-pseudoinverse(H) %*% Y
#  W<-solve(t(H)%*%H+0.1*diag(p))%*%t(H)%*%Z

Yhat_train<-sign(H %*% W)
e_train<-sum((Y-Yhat_train)^2)/4
print(e_train) #  numero de amostras

Xaug_t<-cbind(replicate(nc*4,1), X_t)
H_t<-tanh(Xaug_t %*% Z)
Yhat_t<-sign(H_t %*% W)
e_t<-sum((Y-Yhat_t)^2)/4
print(e_t)


# contour 2 d para plotar
