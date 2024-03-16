% Example 8.2 from César Fernando Méndez Barrios, "Low-Order Controllers for Time-Delay Systems : an Analytical Approach". 2012 PhD thesis
% https://theses.hal.science/tel-00719477v1/document
w=0:0.01:100;
kpx=0.1E1.*w.^(-1).*(0.E-307+(-0.644856E2).*w.^3.*cos(0.E-307+0.4896E1.*w)+( ...
  -0.103326E2).*w.^2.*sin(0.E-307+0.4896E1.*w));
kix=0.E-307+(-0.103326E2).*w.^2.*cos(0.E-307+0.4896E1.*w)+0.644856E2.*w.^3.* ...
  sin(0.E-307+0.4896E1.*w);
set(gcf,'color','w');
kp0=-3:1:3;
ki0=zeros(1,length(kp0));
plot(kpx,kix,'b') % w vale todo menos 0 e infinito
hold on
plot(kp0,ki0,'r')
xlabel('$k_p$','Interpreter','Latex','FontSize', 16)
ylabel('$k_i$','Interpreter','Latex','FontSize', 16)
axis([-3 1 -0.08 0.02])

[kp,ki]=ginput(1);
s = tf('s');
P=(-1.308*exp(-4.896*s))/((13.515*s)*(6.241*s + 1));
C=kp+ki/s;
T=feedback(P*C,1);
[y,t]=step(T,500);


figure
set(gcf,'color','w');
plot(t,y)
xlabel('$t$','Interpreter','Latex','FontSize', 16)
ylabel('$y(t)$','Interpreter','Latex','FontSize', 16)
