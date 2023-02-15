rm(list = ls())
library(plotrix)


x = seq(-1,1, by=0.1)
y = seq(-1,1, by=0.1)

create_grid <- expand.grid(x, y)

circle<-function(x,y){
  return(sqrt(x^2+y^2))
}

raio=0.6
classe =1*(circle(create_grid$Var1, create_grid$Var2) > raio)
# plot(x, classe)
#draw.circle(x, y, radius=raio, border='red')

