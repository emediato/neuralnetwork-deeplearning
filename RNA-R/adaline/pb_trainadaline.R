pb_trainadalne <- function(Xin,Yin,tol,eta,maxepoch,par){

  Xin<- cbind(runif(50,0,20),sin(runif(50,-4,4)))
  Yin<- 4 *Xin[,1]+7*Xin[,2] + 1.2 
  tol<-0.01
  eta<-0.001
  maxepoch<-1000
  par<-1
  

  Y <- as.matrix(Yin)
  dimX <- dim(as.matrix(Xin))
  lX <- dimX[1]
  cX <- dimX[2]
  
  if(par==1){
    w <- as.matrix(runif(runif(cX+1)-0.5))
    X <- cbind(1,Xin)
  } else {
    w <- as.matrix(runif((cX)-0.5))
  }
  
  
  epoch <- 0
  epoch_error <- tol+1
  
  
  
  while( epoch_error>tol && epoch<maxepoch ){
    error <- 0
    ei2 <- 0 
    
    xseq <- sample.int(lX,lX)
    
    xmatrix <- as.matrix(X[xseq,]) 
    ymatrix <- as.matrix(Y[xseq,])
    for(i in 1:lX){
      iseq = xseq[i]
      error <- (Y[iseq]-t(w)%*%X[iseq,])
      w <- w + eta*error*X[iseq,]
      ei2 <- ei2 + error*error
    }
    
    ei2 <- ei2/lX
    epoch_error[epoch] <- ei2
    epoch <- epoch +1
  }
  
  retlist <- list(w,epoch_error)
  
  
  return(retlist)   
}
