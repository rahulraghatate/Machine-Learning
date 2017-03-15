%Author - Rahul Raghatate
%ID- rraghata
%Answer 6

% Clear Workspace
clear
% Load the data and plot the histogram for distribution
dataset = dlmread('hw3dat.txt');
h0= dataset(:,1);
h1= dataset(:,2);
source= dataset(:,3);
test= dataset(:,4);
% Histogram Plot for idea of data distribution
subplot(1,2,1)
hist(h0);
title('Histogram for H_0')
xlabel('H_0')

subplot(1,2,2)
hist(h1);
title('Histogram for H_1')
xlabel('H_1')

% Prior Calculations using Source distribution information.
pi0 = sum(source==0)/2000
pi1= 1-pi0

% Therefore,from the histograms,two decision rules can be made intutively as follows: 
% First Rule : H_1=0 if -1<=y<=1;
%              H_1=1 otherwise

% Second Rule :H_1=0 if -1.5 <=y<= 1.5 ;
%              H_1=1 otherwise

% First Rule Analysis and Calculations
dataset(:,5)= test>=-1 & test<=1;
dataset(:,5)=~dataset(:,5); %used negation as logical operation output gives one if true in above equation
preds= dataset(:,5);

% Calculatations for costs(PiTj) of decision 
c_00 = sum(source== 0 & preds== 0)/2000;
c_01 = sum(source== 1 & preds== 0)/2000;
c_11 = sum(source== 1 & preds== 1)/2000;
c_10 = sum(source== 0 & preds== 1)/2000;

 
 % For uniform costs Baye's risk
 risk_B1 =pi0*(sum(source== 0 & preds== 1)/2000)+ pi1*(sum(source== 1 & preds== 0)/2000)
 
 % Second Rule Analysis and Calculations
 dataset(:,6)= test>=-1.5 & test<=1.5;
 dataset(:,6)=~dataset(:,6);
 preds1= dataset(:,6);

 % Calculate the cost of decision PiTj
 c_00 = sum(source== 0 & preds1== 0)/2000;
 c_01 = sum(source== 1 & preds1== 0)/2000;
 c_11 = sum(source== 1 & preds1== 1)/2000;
 c_10 = sum(source== 0 & preds1== 1)/2000;
 
 % Taking uniform cost and computing baye's risk
 risk_B2 =pi0*(sum(source== 0 & preds1== 1)/2000)+ pi1*(sum(source== 1 & preds1== 0)/2000)
 
 disp('Bayes Risk for both the decision rules are:\n');
 fprintf('Decision Rule_1 %d\n',risk_B1);
 fprintf('Decision Rule_2 %d\n',risk_B2);
