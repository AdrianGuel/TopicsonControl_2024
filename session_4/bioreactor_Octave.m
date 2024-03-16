% Example 6.1 from César Fernando Méndez Barrios, "Low-Order Controllers for Time-Delay Systems : an Analytical Approach". 2012 PhD thesis
% https://theses.hal.science/tel-00719477v1/document
close all
w=0:0.01:10;
kpx=(0.764526E0+(-0.644856E2).*w.^2).*cos(0.4896E1.*w)+(-0.15104E2).*w.*sin( ...
  0.4896E1.*w);
kix=w.*((-0.15104E2).*w.*cos(0.4896E1.*w)+((-0.764526E0)+0.644856E2.*w.^2).* ...
  sin(0.4896E1.*w));

figure
kp0=-4:1:1;
ki0=0*ones(1,length(kp0));
set(gcf,'color','w');
plot(kpx,kix,'b') % w vale todo menos 0 e infinito
hold
plot(kp0,ki0,'r') %w=0
xlabel('$k_p$','Interpreter','Latex','FontSize', 16)
ylabel('$k_d$','Interpreter','Latex','FontSize', 16)
axis([-4 1 -0.5 0.1])
hold off

[kp,ki,~]=ginput(1);
s = tf('s');
%P=(-1.308*exp(-4.896*s))/((13.515*s + 1)*(6.241*s + 1));
approx_order=4;
[num_delay, den_delay] = padecoef (4.896, approx_order)
delay_tf=tf(num_delay,den_delay);
P=(-1.308*delay_tf)/((13.515*s + 1)*(6.241*s + 1));
C=kp+ki/s;
T=feedback(P*C,1);
figure
[y,t]=step(T,200);
plot(t,y)
