##README##
##run in Python version 3.X

#Author: Rahul Raghatate
#date: 25-04-2017


##Implement a two-layer perceptron with the backpropagation algorithm to solve the parity problem.

#code#
import numpy as np
import matplotlib.pyplot as plt

#Sigmoid function
def phi(v):
     return 1/(1 + np.exp(-v))

def main(eta):
    Input = np.array([[0,0,0,0,1],[0,0,0,1,1],[0,0,1,0,1],[0,0,1,1,1],[0,1,0,0,1],[0,1,0,1,1],[0,1,1,0,1],[0,1,1,1,1],[1,0,0,0,1],[1,0,0,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,0,0,1],[1,1,0,1,1],[1,1,1,0,1],[1,1,1,1,1]])
    d_o = np.array([[0],[1],[1],[0],[1],[0],[0],[1],[1],[0],[0],[1],[0],[1],[1],[0]])
    wt_l1 = np.random.uniform(-1,1,(4,5))
    wt_l2 = np.random.uniform(-1,1,(1,5))
    delta_l1_wt = np.zeros((4,5))
    delta_l2_wt = np.zeros((1,5))
    
    epoch = 0
    print('Eta=',n)
    #learning
    while True:
        diff = []
        for i in range(16):
            ip = np.reshape(Input[i,],(5,1))
            d = d_o[i]
            xw1 = wt_l1.dot(ip)
            l1_o = phi(xw1)
            l1_o = np.append(l1_o,[[1]],axis=0)
            l1w2 = wt_l2.dot(l1_o)
            l2_o = phi(l1w2)
            l2_error = d - l2_o
            delta_l2 = l2_error*l2_o*(1-l2_o)
            delta_l1 = wt_l2.T*delta_l2*l1_o*(1-l1_o)
            delta_l2_wt = eta * delta_l2.dot(l1_o.T) + 0.9 * delta_l2_wt
            delta_l1_wt = eta * delta_l1[:-1].dot(ip.T) + 0.9 * delta_l1_wt
            wt_l1 = wt_l1 + delta_l1_wt
            wt_l2 = wt_l2 + delta_l2_wt
            diff.append(l2_error[0,0])
        epoch = epoch + 1
        error = np.max(np.abs(diff))
        if error<=.05:
            break
            
    #Epoch and Error
    print('Number of Epochs=',epoch)
    print('Error=',error,'\n')
    return epoch

#Define the etas
n = np.arange(.05,.55,.05)
#define the epochs
epochs = list(map(main,etas))

#Plots
plt.plot(etas,epochs)
plt.xlabel('Eta(n)')
plt.ylabel('Epoch')
plt.show()
