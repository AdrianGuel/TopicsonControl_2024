%Recursive Least squares for an adaptative controller
%Adrian J Guel C
%29/Sep/2020
clear all
close all
%% Global parameteres
gamma=0.2;
a=1;
n=2;
ts=1e-1;
%% Finding the initial condition of our parameters
num=1;
den=[1,5,10];
out=sim('experimentident',30);
t=out.experiment{1}.Values.Time;
u=out.experiment{1}.Values.Data(:,1);
y=out.experiment{1}.Values.Data(:,2);
[theta_0,P,f_0]=LeastSquaresOffline(u,y,n,a,gamma);

numdi=zeros(1,n);
dendi=zeros(1,n+1);
dendi(1)=1;
for i=1:n
    numdi(i)=theta_0(n+i);
    dendi(i+1)=-theta_0(i);
end
%% Step reponse comparison
out=sim('step_responses',30);
t=out.responses{1}.Values.Time;
u=out.responses{1}.Values.Data(:,1);
yr=out.responses{1}.Values.Data(:,2);
ye=out.responses{1}.Values.Data(:,3);
figure;
plot(t,yr,'k')
hold on;
plot(t,ye,'r--')
legend('real','estimated')

%% Recursive LQS simulation
gamma=0.5;
num=1;
den=[1,5,8];
out=sim('step_responses_sin',30);
t=out.responses{1}.Values.Time;
u=out.responses{1}.Values.Data(:,1);
y=out.responses{1}.Values.Data(:,2);
[theta_k,P_k,f_k]=recursiveleastsquares(u(1),y(1),P,theta_0,f_0',a,gamma,n);
for k=i:length(t)
    [theta_k,P_k,f_k]=recursiveleastsquares(u(k),y(k),P_k,theta_k,f_k,a,gamma,n);
end
numdi=zeros(1,n);
dendi=zeros(1,n+1);
dendi(1)=1;
for i=1:n
     numdi(i)=theta_k(n+i);
     dendi(i+1)=-theta_k(i);
end
out=sim('step_responses',30);
t=out.responses{1}.Values.Time;
yr2=out.responses{1}.Values.Data(:,2);
ye2=out.responses{1}.Values.Data(:,3);

figure;
plot(t,yr2,'k')
hold on;
plot(t,ye2,'r--')
legend('real','estimated')