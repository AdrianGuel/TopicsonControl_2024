% PID with gradient descent!
% Guel Cortez 2024
close all; clearvars;
m=1; b=1; T=1e-1;
end_time=100;
t=0:T:end_time;
x=zeros(2,length(t));
u=zeros(1,length(t));
e=zeros(1,length(t));
gains=zeros(3,length(t));

A=[[0,1];[0,-b/m]]; 
Bd=T*[0;1/m];
Ad=(eye(2)+T*A); kp=1;kd=0.5;ki=0.5; alpha=1e-6;
q0=kp+kd/T+ki*T;
q1=-kp-2*kd/T;
q2=kd/T;
x(:,1)=[0;0];
gains(:,1)=[q0,q1,q2]';
force_thd=10;
goal=1;

for k=2:length(t)
  if mod(k,300)==0
    goal=goal+2;
  end
  x(:,k)=Ad*x(:,k-1)+Bd*u(k-1);
  e(k)=goal-x(1,k);
  if k==2
    u(k)=u(k-1)+q0*e(k)+q1*e(k-1);
    if u(k)>force_thd
        u(k)=force_thd;
    elseif u(k)<-force_thd
        u(k)=-force_thd;
    end    
    dydu=(x(1,k)-x(1,k-1))/(u(k)-u(k-1));
    q0=q0+alpha*e(k)*dydu*e(k);
    q1=q1+alpha*e(k)*dydu*e(k-1);
  else
    u(k)=u(k-1)+q0*e(k)+q1*e(k-1)+q2*e(k-2);
    if u(k)>force_thd
        u(k)=force_thd;
    elseif u(k)<-force_thd
        u(k)=-force_thd;
    end    
    dydu=(x(1,k)-x(1,k-1))/(u(k)-u(k-1));
    q0=q0+alpha*e(k)*dydu*e(k);
    q1=q1+alpha*e(k)*dydu*e(k-1);
    q2=q2+alpha*e(k)*dydu*e(k-2);
  end
  gains(:,k)=[q0,q1,q2]';
end

figure;
subplot(3,1,1)
plot(t,x(1,:))
xlabel("$t$",Interpreter="latex")
ylabel("$x_1$",Interpreter="latex")
subplot(3,1,2)
plot(t,u)
xlabel("$t$",Interpreter="latex")
ylabel("$u$",Interpreter="latex")
subplot(3,1,3)
plot(t,e)
xlabel("$t$",Interpreter="latex")
ylabel("$e$",Interpreter="latex")

figure;
subplot(3,1,1)
plot(t,gains(1,:))
xlabel("$t$",Interpreter="latex")
ylabel("$q_0$",Interpreter="latex")
subplot(3,1,2)
plot(t,gains(2,:))
xlabel("$t$",Interpreter="latex")
ylabel("$q_1$",Interpreter="latex")
subplot(3,1,3)
plot(t,gains(3,:))
xlabel("$t$",Interpreter="latex")
ylabel("$q_2$",Interpreter="latex")
