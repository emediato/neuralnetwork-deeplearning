resposta_perceptron_simples<-function(vector_in, w){
  #yp ou resposta perceptron
  #vector_in: vetor entrada
  #w: vetor pesos

  u<- vector_in %*% w
  y<-1.0*(u>=0)



  return(as.matrix(y))
}