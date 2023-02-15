trainadaline <- function(xin,yd,eta,tol,maxepocas,par) {
    # par = colocar coluna adicional ao x ou nao, se x ja tiver esse numero correspondente
     # compatibilidade de produto, 1 pode ser colocado na funcao ou nao

    dimxin<-dim(xin) #
    N<-dimxin[1]
    n<-dimxin[2]

    if (par==1){
        wt<-as.matrix(runif ( n + 1 ) - 0.5)
        xin<-cbind( 1 , xin )
    }
    else {wt<-as.matrix(runif(n)-0.5)}  # inicializacao dos pesos com base a dimensao usada

    nepocas<-0
    eepoca<-tol+1

    evec<-matrix(nrow=1,ncol=maxepocas)

    while ((nepocas < maxepocas) && (eepoca>tol))
    {
        ei2<-0
        xseq<-sample(N)

        for (i in 1:N)
        {
            irand<-xseq[i]
            yhati<-1.0*((xin[irand ,] %*% wt))
            ei<-yd[irand] - yhati
            dw<-eta*ei*xin[irand ,]
            wt<-wt+dw
            ei2<-ei2+ei*ei
        }

        nepocas<-nepocas+1
        evec[nepocas] <- ei2 / N

        eepoca<-evec[nepocas]
    }
    retlist <- list(wt, evec[1:nepocas]) # retorna lista de dois elementos
    return(retlist)
}

T_TEMPO_AMOSTRAGEM_SINAIS <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\Ex1_t"))
X_SINAL_ENTRADA <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\Ex1_x"))
Y_SINAL_SAIDA <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\Ex1_y"))

x <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\x"))
y <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\y"))
t <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\t"))

plot(t, x, type='b', col='blue', pch=19)
lines(t, y, type='b', col='red', pch=19)
legend("bottom", legend=c('in', 'out'), col= c('blue', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=1, seg.len=1, bty='n')

train_idx = c(1,4,5,6,7,8,11,12,14,15,16,18)
test_idx = c(1,2, 9, 13, 17, 19)

m_train_idx = matrix(train_idx)
m_test_idx = matrix(test_idx)

# SELECT TEST AND TRAINING DATA
train_x <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\train_x"))
train_y <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\train_y"))
train_t <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\train_t"))


test_x <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\x"))
test_y <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\y"))
test_t <-as.matrix(read.table("C:\\Users\\monic\\PycharmProjects\\RNA-R\\ex3\\dados\\t_test"))


plot(train_t, train_y, type='b', col='blue', pch=19)
lines(test_t, test_y, type='b', col='red', pch=19)
legend("left", legend=c('train', 'test'), col= c('blue', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=1, seg.len=1, bty='n')


# = matrix(train_x)
#matrix_y = matrix(train_y)

retlist<-trainadaline_monica(train_x, train_y, 0.01, 0.001, 100, 1)


#retlist<-trainadaline_monica(X_SINAL_ENTRADA,Y_SINAL_SAIDA,0.01, 0.001,50,1)
plot(retlist[[2]], type='line') # erro

w = (retlist[[1]]) # w
plot(retlist[[1]], type='line') # erro

yhat <-(cbind(1, test_x) %*% w)
yhattrain <-(cbind(1, train_x) %*% w)

plot(t, y, type='b', col='red', pch=19)
lines(test_t, yhat, type='b', col='black', pch=19)
lines(train_t, yhattrain, type='b', col='black')
lines(train_t, yhattrain, type='b', col='blue', pch=19)

title("amostras usadas para teste")
legend('left', legend=c('previsto', 'teste', 'original'), col= c('blue','black', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=0.75, seg.len=0.75, bty='n')


