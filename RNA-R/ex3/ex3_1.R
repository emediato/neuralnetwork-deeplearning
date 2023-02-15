

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

plot(T_TEMPO_AMOSTRAGEM_SINAIS, X_SINAL_ENTRADA, type='b', col='blue', pch=19)
lines(T_TEMPO_AMOSTRAGEM_SINAIS, Y_SINAL_SAIDA, type='b', col='red', pch=19)
legend("bottom", legend=c('in', 'out'), col= c('blue', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=1, seg.len=1, bty='n')

test_data <- list()
test_x <- list()
test_y <- list()
test_t <- list()

train_data <- list()
train_x <- list()
train_y <- list()
train_t <- list()

test_data <- c()
test_x <- c()
test_y <- c()
test_t <- c()

train_data <- c()
train_x <- c()
train_y <- c()
train_t <- c()
# SELECT TEST AND TRAINING DATA
for (i in 1:length(T_TEMPO_AMOSTRAGEM_SINAIS)){
  if (i == 3 ||  i==7 || i==11 || i==13 || i==17){
    test_data <- c(test_data, T_TEMPO_AMOSTRAGEM_SINAIS[i][1], X_SINAL_ENTRADA[i][1])
    test_t <- c(test_t, T_TEMPO_AMOSTRAGEM_SINAIS[i][1])
    test_x <- c(test_x, X_SINAL_ENTRADA[i][1])
    test_y <- c(test_y, Y_SINAL_SAIDA[i][1])
  }
  else {
    train_data <- c(train_data, T_TEMPO_AMOSTRAGEM_SINAIS[i][1], X_SINAL_ENTRADA[i][1])
    train_t <- c(train_t, T_TEMPO_AMOSTRAGEM_SINAIS[i][1])
    train_x <- c(train_x, X_SINAL_ENTRADA[i][1])
    train_y <- c(train_y, Y_SINAL_SAIDA[i][1])
  }
}


plot(train_t, train_x, type='b', col='blue', pch=19)
lines(train_t, train_y, type='b', col='red', pch=19)
legend("bottom", legend=c('in', 'out'), col= c('blue', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=1, seg.len=1, bty='n')

plot(test_t, test_x, type='b', col='blue')
lines(test_t, test_y, type='b', col='red')
#legend("bottom", legend=c('test in', 'test out'), col= c('blue', 'red'), lwd=5, xpd=TRUE, horiz=TRUE, cex=1, seg.len=1, bty='n')


#retlist<-trainadaline_monica(X_SINAL_ENTRADA,Y_SINAL_SAIDA,0.01, 0.001,50,1)
#retlist<-trainadaline_monica(x,y,0.01, 0.1,100,1)
#retlist<-trainadaline(x,y,0.01, 0.1,100,1)
matrix_x = matrix(test_x)
matrix_y = matrix(test_y)

retlist<-trainadaline(matrix_x, matrix_y, 0.01, 0.1, 100, 1)
#retlist<-trainadaline_monica(X_SINAL_ENTRADA,Y_SINAL_SAIDA,0.01, 0.001,50,1)
plot(retlist[[2]], type='line') # erro
print(retlist[[1]]) # w


