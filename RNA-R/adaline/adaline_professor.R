# professor Antônio Braga

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

x<-as.matrix(seq(0,10,0.1))
xteste<-as.matrix(seq(0,10,0.5))
y<-as.matrix(x*2+4)

retlist<-trainadaline(x,y,0.01, 0.1,100,1)
plot(retlist[[2]], type='b')

print(retlist[[1]])


# TESTE
xtst_<-as.matrix(seq(0,10,0.5))
xtst <-cbind(1,xtst_)
ytst<-xtst%*%retlist[[1]]

plot(x,y,type='b',  xlim=c(0,10),  ylim=c(0,25))
par(new=T)
plot(xtst_,ytst,  type='l', col='blue', xlim=c(0,10), ylim=c(0,25))


#plot(x,y,type='b')
#par(new=T)

