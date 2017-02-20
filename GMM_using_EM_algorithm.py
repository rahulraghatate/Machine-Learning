#########Author: RAHUL RAGHATATE#######
import numpy as np
import pandas as pd
import math
import random
import pylab as plt
import matplotlib.mlab as mlab
#Select and assign the data file accordingly #
#data = np.loadtxt("data1.txt")
#data = np.loadtxt("data2.txt")
data = np.loadtxt("data3.txt")
n = len(data)
eps = 1e-9
print("no of data points",n)

for i in range(3):
    count = int(input("Enter value for count of gaussians:"))
    max_iter = int(input("Enter value for iterations:"))
    prob_x_c = np.zeros((count, n))  # P(xi|c)
    prob_c_x = np.zeros((count, n))
    prod=prob_x_c
    sums=[]
    
    ###Initialization
    p_c = np.ones(count) * (1 / count)  # weights
    mu = data[np.random.choice(n, count, False)]
    # sigma=np.array(np.random.choice(20, count)+1)*.01
    sigma = mu * 0.1
    mu_s = []
    sd_s = []
    wts = []
    print("initial mu",mu,"\n initial sigma",sigma,"\n initial weights",p_c)
    log_likelihoods = []
    L2 = []
    for i in range(max_iter):

        # Expectation Step:
        for k in range(count):
            prob_x_c[k]= mlab.normpdf(data, mu[k], sigma[k])#(Gaussian Function)*P(C)
            prod[k] = p_c[k] * mlab.normpdf(data, mu[k], sigma[k])
        sums = np.sum(prod, axis=0)  # P(X_j)
        prob_c_x = prod / sums

        # Maximization Step
        p_c = np.sum(prob_c_x, axis=1) / n  # new class prior
        mu = np.sum(prob_c_x * data, axis=1) / np.sum(prob_c_x, axis=1)
        sigma = np.sqrt(np.sum(prob_c_x * pow(data - mu[:, np.newaxis], 2), axis=1) / np.sum(prob_c_x, axis=1))

        mu_s.append(mu)
        sd_s.append(sigma)
        wts.append(p_c)
        
        # Log Likelihood
        L = 0
        L += np.log(np.sum(prod, axis=1)/n)
        log_likelihoods.append(L)
        L2 = np.sum(np.array(log_likelihoods), axis=1)#TOTAL OF INDIVIDUAL LIKELIHOODS 

        # Convergence test#
        if len(L2) < 2: continue
        if np.abs(L2[i] - L2[i - 1]) < eps: break


    print("the resulting model parameters ::means, standard deviations, and weights")
    print("final mu",mu,"\n final sigma",sigma,"\n final weights",p_c)
    print("no of iterations performed",len(mu_s))
    plt.plot(mu_s)
    plt.title('Means vs iteration plot')
    plt.xlabel('Iterations')
    plt.ylabel('Means')
    plt.show()
    plt.plot(sd_s)
    plt.title('SD\'s vs iteration plot')
    plt.xlabel('Iterations')
    plt.ylabel('SD\'s')
    plt.show()
    plt.plot(log_likelihoods)
    plt.title('Individual likelihoods vs iteration plot')
    plt.xlabel('Iterations')
    plt.ylabel('individual likelihoods')
    plt.show()
    plt.plot(L2)
    plt.title('Log Likelihood vs iteration plot')
    plt.xlabel('Iterations')
    plt.ylabel('log likelihood')
    plt.show()
