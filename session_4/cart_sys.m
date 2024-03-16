%Author Adrian Josue Guel Cortez
% March 2024
% cart model in one dimension

w=0:0.01:100;
m=1; b=0.3;
kpx=m*w.^2;
kdx=-b*ones(1,length(w));
kd0=-10:1:10;
kp0=0*ones(1,length(kd0));
set(gcf,'color','w');
plot(kpx,kdx,'b') % w vale todo menos 0 e infinito
hold on
plot(kp0,kd0,'r') % w=0
xlabel('$k_p$','Interpreter','Latex','FontSize', 16)
ylabel('$k_d$','Interpreter','Latex','FontSize', 16)
axis([-10 10 -10 10])

[kp,kd]=ginput(1);
s = tf('s');
P=1/(s*(m*s+b));
C=kp+kd*s;
T=feedback(P*C,1);
[y,t]=step(T,50);

figure
set(gcf,'color','w');
plot(t,y)
xlabel('$t$','Interpreter','Latex','FontSize', 16)
ylabel('$y(t)$','Interpreter','Latex','FontSize', 16)
