%Author - Rahul Raghatate
%ID- rraghata
%Answer 7
seed=100
rng(seed)
%Workspace clear
clear
%Function call for a
[trans,obs]=binchan(0.3,0.1,0.2)
% Prior Prob.
pi0 = 0.3
pi1= 1-pi0
% Calculatations for costs(PiTj) of decision 
c_00 = sum(trans== 0 & obs== 0)/5000;
c_01 = sum(trans== 1 & obs== 0)/5000;
c_11 = sum(trans== 1 & obs== 1)/5000;
c_10 = sum(trans== 0 & obs== 1)/5000;
% Baye's risk
prob_error1 =pi0*(sum(trans== 0 & obs== 1)/5000)+ pi1*(sum(trans== 1 & obs== 0)/5000)
prob_fa1=sum(trans== 0 & obs== 1)/5000;

%Function call for b
[trans,obs]=binchan(0.3,0.7,0.2)
% Prior Prob.
pi0 = 0.3
pi1= 1-pi0
% Calculatations for costs(PiTj) of decision 
c_00 = sum(trans== 0 & obs== 0)/5000;
c_01 = sum(trans== 1 & obs== 0)/5000;
c_11 = sum(trans== 1 & obs== 1)/5000;
c_10 = sum(trans== 0 & obs== 1)/5000;
% Baye's risk
prob_error2 =pi0*(sum(trans== 0 & obs== 1)/5000)+ pi1*(sum(trans== 1 & obs== 0)/5000)
prob_fa2=sum(trans== 0 & obs== 1)/5000; 

%Function call for c
[trans,obs]=binchan(0.8,0.5,0.6)
% Prior Prob.
pi0 = 0.8
pi1= 1-pi0
% Calculatations for costs(PiTj) of decision 
c_00 = sum(trans== 0 & obs== 0)/5000;
c_01 = sum(trans== 1 & obs== 0)/5000;
c_11 = sum(trans== 1 & obs== 1)/5000;
c_10 = sum(trans== 0 & obs== 1)/5000;
% For uniform costs Baye's risk
prob_error3 =pi0*(sum(trans== 0 & obs== 1)/5000)+ pi1*(sum(trans== 1 & obs== 0)/5000)
prob_fa3=sum(trans== 0 & obs== 1)/5000;

%Function call for d
[trans,obs]=binchan(0.5,0.5,0.5)
% Prior Prob.
pi0 = 0.5
pi1= 1-pi0
% Calculatations for costs(PiTj) of decision 
c_00 = sum(trans== 0 & obs== 0)/5000;
c_01 = sum(trans== 1 & obs== 0)/5000;
c_11 = sum(trans== 1 & obs== 1)/5000;
c_10 = sum(trans== 0 & obs== 1)/5000;
%Baye's risk
prob_error4 =pi0*(sum(trans== 0 & obs== 1)/5000)+ pi1*(sum(trans== 1 & obs== 0)/5000);
prob_fa4=sum(trans== 0 & obs== 1)/5000;

%Part e
disp('probability of error of the four possible deterministic decision rules.\n');
fprintf('prob_error1=%d\n prob_error2=%d\n prob_error3=%d\n prob_error4=%d\n',prob_error1,prob_error2,prob_error3,prob_error4);
disp('the probability of false alarm for these four rules \n');
fprintf('prob_fa1: %d\n prob_fa2: %d\n prob_fa3: %d\n prob_fa4: %d\n',prob_fa1,prob_fa2,prob_fa3,prob_fa4);