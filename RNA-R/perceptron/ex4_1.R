library('plot3D')
source('trainperceptron.R')
source('')
s1<-0.4
s2<-0.4
nc<-200
xc1<-matrix((rnorm(nc*2), ncol=2)*s1 + t(matrix((c(2,2), ncol=nc,nrow=2))
xc2<-matrix((rnorm(nc*2), ncol=2)*s1 + t(matrix((c(4,4), ncol=nc,nrow=2))

plot(xc1[,1],xc1[,2],col='red', xlim = c(0,6),xlab= 'x_1', ylab='x_2')
par(new=T)
plot(xc2[,1],xc2[,2],col='blue', xlim = c(0,6),xlab= '', ylab='')

x1_reta<-seq(6/100,6,6/100)
x2_reta<- -x1_reta+6
par(new=T)
plot(x1_reta,x2_reta, type='l',col='orange', xlim=c(0,6))