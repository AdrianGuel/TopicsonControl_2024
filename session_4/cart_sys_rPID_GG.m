% PID with gradient descent!
% Guel Cortez 2024
close all; clearvars;
m=1; b=0.7; T=1e-2;
end_time=1;
t=0:T:end_time;
x=zeros(2,length(t));
u=zeros(1,length(t));
e=zeros(1,length(t));
q0=zeros(1,length(t));
q1=zeros(1,length(t));
q2=zeros(1,length(t));

A=[[0,1];[0,-b/m]]; 
Bd=T*[0;1/m];
Ad=(eye(2)+T*A); kp=1;kd=9;ki=1; alpha=1e-4;
q0=kp+kd/T+ki*T;
q1=-kp-2*kd/T;
q2=kd/T;
x(:,1)=[0;0];

goal=5;
for k=2:length(t)
  x(:,k)=Ad*x(:,k-1)+Bd*u(k-1);
  e(k)=goal-x(1,k);
  if k==2
    u(k)=u(k-1)+q0*e(k)+q1*e(k-1);
    dydu=(x(1,k)-x(1,k-1))/(u(k)-u(k-1));
    q0=q0+alpha*e(k)*dydu*e(k);
    q1=q1+alpha*e(k)*dydu*e(k-1);
  else
    u(k)=u(k-1)+q0*e(k)+q1*e(k-1)+q2*e(k-2);
    dydu=(x(1,k)-x(1,k-1))/(u(k)-u(k-1));
    q0=q0+alpha*e(k)*dydu*e(k);
    q1=q1+alpha*e(k)*dydu*e(k-1);
    q2=q2+alpha*e(k)*dydu*e(k-2);
  end
end
% 
figure;
subplot(3,2,1)
plot(t,x(1,:))
subplot(3,2,2)
plot(t,u)
subplot(3,2,3)
plot(t,e)

subplot(3,2,4)
plot(t,q0)
subplot(3,2,5)
plot(t,q1)
subplot(3,2,6)
plot(t,q2)
