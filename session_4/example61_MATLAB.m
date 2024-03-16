%Author Adrian Josue Guel Cortez
%January 2021
%If this code helped you please cite one of the folowing works
% César Fernando Méndez Barrios, "Low-Order Controllers for Time-Delay Systems : an Analytical Approach". 2012 PhD thesis
% Guel-Cortez, Adrián Josué, et al. "Geometrical design of fractional PDμ controllers for linear time-invariant fractional-order systems with time delay." 
% Proceedings of the Institution of Mechanical Engineers, Part I: Journal of Systems and Control Engineering 233.7 (2019): 815-829.


w=0:0.01:100;
kpx=(1+4.*w.^2+(-30).*w.^4+49.*w.^6+w.^8).^(-1).*(((-24)+257.*w.^2+(-730).* ...
  w.^4+579.*w.^6+(-31).*w.^8+(-1).*w.^10).*cos((1/20).*w)+w.*(122+(-481).* ...
  w.^2+792.*w.^4+(-229).*w.^6+(-4).*w.^8).*sin((1/20).*w));
kdx=(w+4.*w.^3+(-30).*w.^5+49.*w.^7+w.^9).^(-1).*(w.*((-122)+481.*w.^2+( ...
  -792).*w.^4+229.*w.^6+4.*w.^8).*cos((1/20).*w)+(-1).*(24+(-257).*w.^2+ ...
  730.*w.^4+(-579).*w.^6+31.*w.^8+w.^10).*sin((1/20).*w));
%Gs=exp(1).^((-1/20).*s).*(1+s).^(-1).*(2+s).^(-1).*(3+s).^(-1).*(4+s).^(-1) ...
% .*(1+s+s.^2).^(-1).*(1+(-2).*s+(-7).*s.^3+(-1).*s.^4);
kd0=-40:1:10;
kp0=-24*ones(1,length(kd0));
set(gcf,'color','w');
plot(kpx,kdx,'b') % w vale todo menos 0 e infinito
hold on
plot(kp0,kd0,'r') % w=0
xlabel('$k_p$','Interpreter','Latex','FontSize', 16)
ylabel('$k_d$','Interpreter','Latex','FontSize', 16)
axis([-30 10 -40 10])

[kp,kd]=ginput(1);
s = tf('s');
P=((-s^4-7*s^3-2*s+1)*exp(-s/20))/((s+1)*(s+2)*(s+3)*(s+4)*(s^2+s+1));
C=kp+kd*s;
T=feedback(P*C,1);
[y,t]=step(T,50);

figure
set(gcf,'color','w');
plot(t,y)
xlabel('$t$','Interpreter','Latex','FontSize', 16)
ylabel('$y(t)$','Interpreter','Latex','FontSize', 16)
