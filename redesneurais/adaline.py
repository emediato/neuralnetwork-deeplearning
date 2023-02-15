import numpy as np
import pandas as pd

def trainadaline_monica(xin,yd,eta,tol,maxepocas,par) :

    #<- function(xin,yd,eta,tol,maxepocas,par) {
    dimxin<-dim(xin)      # xin : matriz N x m com os dados de entrada

    N_linhas<-dim(xin)[1] # recebe as linhas de xin
    m_coluna <-dim(xin)[2] # recebe as colunas de xin

    #  par: par=1 indica que -1 precisa ser acrescido a xin
    # # par=1 ==> xin tem dimensão n e não inclui
    if (par==1){
      # inicializa vetor pesos wt
        wt<-as.matrix(runif(m_coluna + 1) - 0.5) #inicializa um vetor de n+1 elementos
        xin<-cbind(1, xin)
    }
    else {     # # par=0 ==> xin tem dimensão n+1 e já inclui
        wt<-as.matrix(runif(m_coluna)-0.5)
        #inicializa um vetor de n+1 elementos
    }

    nepocas<-0
    # tol : tolerância de erro
    error_epoca<-tol+1
    vec_error <-matrix(nrow=1,ncol=maxepocas) # inicializa vetor erro vec_error,

    # maxepocas: número máximo de iterações par : parâmetro de entrada .
    # epocas erro da epoca e tol tolerancia
    while ((nepocas < maxepocas) && (error_epoca>tol)){

        ei2<-0
        xseq<-sample(N_linhas)

        for (i in 1:N_linhas) {  # padrao para sequencia aleatoria

            irand<-xseq[i]
            #error = y[iseq] - transposta w = wt * x[iseq,]
            yhati<-1.0*((xin[irand ,] %*% wt))

            # yd: rótulos de saída
            ei<-yd[irand] - yhati

            # eta : passo de treinamento
            dw<-eta*ei*xin[irand ,]
            # atualizacao do peso w
            wt<-wt+dw
            # erro acumulado
            ei2<-ei2+ei*ei
        }
        # numero de epocas
        nepocas<-nepocas+1
        vec_error[nepocas] <- ei2/N_linhas
        #erro por epoca
        error_epoca<-vec_error[nepocas]
    }
    retlist <- list(wt, vec_error[1:nepocas]) # retorna lista de dois elementos
    return(retlist)
}
