# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import numpy as np
import pandas as pd

# a cada amostra ele atualiza
# resposta eh uma planta linear


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


def train_adaline(xin, ydm, eta, tol, maxepocas, par):
    #dimxin = np.zeros((xin, 1), dtype=np.float64)
    # dimxin = np.array(xin)
    #
    dimxin = [[8, 10, 12], [12, 7, 4]]

    N = dimxin[0]
    n=dimxin[1]

    if (par==1):
        wt = np.zeros((xin, 1), dtype=np.float64)
        # colum bind = concat can be use to combine data frames together by their columns
        xin = pd.concat([1, xin], axis=1)
    else:
        # cria matriz 1 coluna
        ## as.matrix transforma o operando em matriz coluna!
        wt = np.random.randint(10, size=(1, 3))

    nepocas = 0
    eepoca= tol +1

    evec = np.random.randint(10, size=(1, maxepocas))

    #while((nepocas < maxepocas) & (epocas>tol)):
        #ei2 =0
        #xseq = sample(N)
        #for i in N:
            #irand = xseq[i]
            #yhati = 1.0 * ((xin[irand,] %*%wt)) # produto matriz elemento por elemento
# Press the green button in the gutter to run the script.

if __name__ == '__main__':

    print_hi('PyCharm')
    train_adaline(1, 1, 1, 1,1, 1)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
