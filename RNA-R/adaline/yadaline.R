yadaline <- function(xin,w,a){
  x0 <- matrix(a,nrow=dim(xin)[1],ncol=1);
  X <- cbind(x0,xin);
  u <-X%*%w;
  for (i in 1:length(u) ){
    if (u[i] < 0){
      u[i]=-1;
    }
    else{
      u[i] = 1;
    }
  }
  return(u)
}
