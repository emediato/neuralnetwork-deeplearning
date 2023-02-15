import numpy as np
import pandas as pd


def trainperceptron(xin, yd, eta, tol, maxepocas, par):
    # xin : matriz Nxn com os dados de entrada
    # yd: rótulos de saída (0 ou 1)
    # eta : passo de treinamento
    # tol : tolerância de erro
    # maxepocas: número máximo de iterações par : parâmetro de entrada .

    # # par=0 ==> xin tem dimensão n+1 e já inclui e
    # entrada correspondente ao  termo de polarização.
    # # par=1 ==> xin tem dimensão n e não inclui

    xin = pd.DataFrame(xin)
    yd = pd.DataFrame(yd)

    n_samples = xin.shape[0]  # samplesnumber
    n_dimension = xin.shape[1]  # Dimensao de entrada.

    # Adiciona ou não um termo de polarização ao vetor de treinamento w.
    if par == 1:
        wt = pd.DataFrame(np.random.sample(n_dimension + 1) - 0.5)
        xin.insert(n_dimension, n_dimension, 1)
    else:
        wt = pd.DataFrame(np.random.sample(n_dimension) - 0.5)

    nepocas = 0  # count seasons
    eepoca = tol + 1  # add error in seasons

    evec = [maxepocas]  # error vector

    # Laço principal de treinamento
    while (nepocas < maxepocas) & (eepoca > tol):
        ei2 = 0
        # Sequencia aleatória de treinamento
        xseq = np.random.randint(0, n_samples, n_samples)

        for i in range(n_samples):
            # Amostra dado da sequencia aleatória
            irand = xseq[i]

            # Calcula saída do Adaline
            yhati = 1.0 * (np.dot(wt.T, pd.DataFrame(xin.iloc[irand])) >= 0)  # yhati = xin[i] X wt.T
            yhati = pd.DataFrame(yhati)

            # Calcula erro
            ei = yd.iloc[irand] - yhati  # erro: ei = (yi − yˆi)
            ei = pd.to_numeric(ei[0][0])

            # ******************************
            # Calcula variaçao no peso
            dw = eta * (ei * xin.iloc[irand])  # dw = η ei xis
            dw = pd.DataFrame(dw).to_numpy()

            # Ajusta vetor de pesos
            wt = pd.DataFrame(wt).to_numpy()
            wt = wt + dw  # w(t+1) = w(t) + dw(t)

            # Acumula erro por época
            ei2 += ei ** 2

            # Incrementa número de épocas
        nepocas = nepocas + 1
        evec.append(ei2 / n_samples)

        # Armazena erro por época
        eepoca = evec[nepocas]

    # Retorna vetores de pesos e de erros
    retlist = [wt, evec[1:nepocas]]

    return retlist


def yp(xvec, w, par):
    # xvec : vetor de entrada
    # w: vetor de pesos
    # yp: resposta do Perceptron

    xvec = pd.DataFrame(xvec)
    w = pd.DataFrame(w)

    if (par == 1):
        xvec = np.append(1, xvec)

    u = np.dot(w.T, xvec)
    y = 1.0 * (u >= 0)

    return y