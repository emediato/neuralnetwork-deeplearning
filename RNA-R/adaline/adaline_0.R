# N = numero linhas de X
# inicializa vetor pesos w

# WHILE erroepoca > tol and nepocas < maxepoca
        # vector xseq = permut from 1 to N
        #for (i in 1:N) {
            #iseq = xseq[i]
            #error = y[iseq] - transposta w * x[iseq,]
            #w = w + n*errpr x[iseq,]
            #ei2 = ei2 + erro^2
        # }
#erroepoca[nepoca] = ei1
#nepocas = nepocas +1

    # # entrada correspondente ao termo
    # # de polarização.


trainadaline_monica <- function(xin,yd,eta,tol,maxepocas,par) {
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


x<-as.matrix(seq(0,10,0.1))
xteste<-as.matrix(seq(0,10,0.5))
y<-as.matrix(x*2+4)

retlist<-trainadaline_monica(x,y,0.01, 0.1,100,1)
plot(retlist[[2]], type='b')

print(retlist[[1]])


# TESTE
xtst_<-as.matrix(seq(0,10,0.5))
xtst <-cbind(1,xtst_)
ytst<-xtst%*%retlist[[1]]

plot(x,y,type='b',  xlim=c(0,10),  ylim=c(0,25))
par(new=T)
plot(xtst_,ytst,  type='l', col='blue', xlim=c(0,10), ylim=c(0,25))

    # WHILE erroepoca > tol and nepocas < maxepoca
    # vector xseq = permut from 1 to N
    #for (i in 1:N) {
    #iseq = xseq[i]
    #error = y[iseq] - transposta w * x[iseq,]
    #w = w + n*errpr x[iseq,]
    #ei2 = ei2 + erro^2
    # }
    #erroepoca[nepoca] = ei1
    #nepocas = nepocas +1
    
    # Regra de Hebb = vetor do peso encontrado por meio do produto cruzado entre as matrizes X e Y, ou seja,
    # w = X(transposta) * Y
    
    
