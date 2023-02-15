import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from trainperceptron import *


s1, s2 = 0.4, 0.4
nc = 100
mu, sigma = 0, 4

xc1 = np.random.normal(0, 1, (nc, 2))*s1 + np.full((2, nc), 2).T # ndarray(200,2)
xc2 = np.random.normal(0, 1, (nc, 2))*s2 + np.full((2, nc), 4).T # ndarray(200,2)

plt.scatter(xc1[:,0], xc1[:,1], c='r')
plt.scatter(xc2[:,0], xc2[:,1], c='b')

x1_reta = np.arange(6/100, 6, 6/100)
x2_reta = -x1_reta+6

plt.plot(x1_reta, x2_reta)
plt.show()

xc = np.concatenate((xc1, xc2), axis=0)
y1 = np.zeros((nc,1))
y2 = np.ones((nc,1))
y = np.concatenate((y1, y2), axis=0)


# train neuron
retlist = trainperceptron(xc,y,0.01,0.01,150,1)

w = retlist[0]
erro = retlist[1]

print("w: ", w)

seqi = np.arange(0,6,0.1)
seqj = np.arange(0,6,0.1)
M =  np.zeros((len(seqi), len(seqj)))
ci = 0

for i in seqi:
    cj=0
    for j in seqj:
        x = np.append([i, j,], 1)
        M[ci][cj] = yp(x, w, 0)
        cj += 1
    ci += 1

plt.scatter(xc1[:,0], xc1[:,1], c='r')
plt.scatter(xc2[:,0], xc2[:,1], c='b')
plt.contour(seqi, seqj, M)
plt.show()

ax = plt.axes(projection='3d')

ax.plot(xc2[:,0], xc2[:,1], zs=0, zdir='z')

#ax.plot_surface(seqi, seqj, M)
plt.contour(seqi, seqj, M)

plt.show()
