# dimensoes
rm(list=ls())

source(file='diretorio para perceptron')
data(iris)
print(rbind(iris[1,], iris[51,], iris[101,]))

plot(iris, col=c("red","green3","blue")[unclass(iris$Species)])

xc1<-as.matrix(iris[1:50,1:4])
xc2<-as.matrix(iris[51:100,1:4])

#
ntrain<-30 # 30 amostrar trineamneto
seqc1<-sample(50) # permutacao de sequencia aleatoria ate 50
xc1treina<-xc1[seqc1[1:ntrain],] # amostra as 30 primeiras
yc1treina<-matrix(0,nrow=ntrain) # y deve atribuir valores de 0 e 1

seqc2<-sample(50)

# classe 1 vai ser 1 - problema vai ser binario
#eu defino arbitrariamente
xc2treina<-xc2[seqc2[1:ntrain],]
yc2treina<-matrix(1, nrow=ntrain)
xc1teste<-xc1[seqc[(ntrain+1):50],]
yc1teste<-matrix(0,nrow=(50-ntrain))
xc2teste<-xc2[seqc2[(ntrain+1):50],]
yc2teste<-matrix(1,nrow=(50-ntrain))

xin<-as.matrix(rbind(xc1treina, xc2treina))
yd<-rbind(yc1treina,yc2treina)
xinteste<-as.matrix(rbind(xc1teste, xc2teste))
yteste<-rbind(yc1teste,yc2teste) # juntando dados

retlist<-trainperceptron(xin, yd, 0.1, 0.01, 100,1)

wt<-retlist[[1]] # 5 termos pois o ultimo eh o termo de polarizacao
# saida degrau
yt<-yperceptron(xinteste,wt,1)

accuracy<-1-(t(yteste-yt) %*% (yteste-yt))/20
print(accuracy)