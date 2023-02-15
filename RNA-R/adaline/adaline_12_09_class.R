rm(list=ls())
library(mlbench)

# adaline = aproximacao linear

#source('diretorio')
data("BostonHousing")

xyboston<-data("BostonHousing")
View(xyboston)

xall<-matrix(as.numeric(as.matrix(BostonHousing[, 1:13])),ncol=13)

yall<-matrix(as.numeric(as.matrix(BostonHousing[,14])),ncol=1)

maxx<-max(xall)
xall<-xall/maxx
maxy<-max(yall)
yall<-yall/maxy

# para avaliar modelo deve-se verificar uma amostra aleatoria
# 506 - > 70% treino = w 
#     - > 20% validacao (pode ser usado p avaliar o dado, ou analisar o processo de selcao)
           # seleciona o modelo
#     - > 10% teste = conjunto que se avalia depois para verificar o desempenho

# ao fazer particao, deve-se ter conhecimento que pode nao ser boa!
# o mais simples eh fazer isso multiplas vezes e fzr erros medios
# divisor de dados - validacao cruzada: particoes do conjunto

# ao fazer multiplas vezes, erro final sera erro medio

# no caso do conjunto real, como selecionar os dados eh importante!
# treinar 
# 1 teste nao eh bom 
plot(xall[,13],yall)


# para incorporar a lineariedade, deve-se verificar o grafico
xyall<-cbind(xall, yall)
library(corrplot)
corrplot(cor(xyall), method="number", type="upper")

# mais proximo de 1 eh melhor!!

xseq<-sample(506)
xtrain<-as.matrix(xall[xseq[1:400],])
ytrain<-as.matrix(yall[xseq[1:400],])
xteste<-as.matrix(xall[xseq[4001:506],])
yteste<-as.matrix(yall[xseq[401:506],])