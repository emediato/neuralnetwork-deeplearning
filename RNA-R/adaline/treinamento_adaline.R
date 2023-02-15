t<-matrix(seq(0, 2*pi, 0.1*pi), ncol=1) # tempo
x<-sin(t) # planta = sinal de entrada
y<-matrix(4*x+2, ncol=1)  #  transformacao linear


plot(t,y, type="l", main="Plot Sequence of Points",
  xlab="x-axis",
  ylab="y-axis")
plot(t,y,type="b")

retlist<-trainadaline_monica(x, y, 0.01, 0.01, 50, 1)
w<-retlist[[1]]
plot(retlist[[2]], type='b')

print(retlist[[1]])
print(retlist[[2]])



retlist<-trainadaline_monica(x,y,0.01, 0.1,100,1)
plot(retlist[[2]], type='b')

print(retlist[[1]])
print(retlist[[2]])


plot(retlist[[2]], type='b')

