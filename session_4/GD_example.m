%Example of gradient descent method
%Guel Cortez 2024
close all;

f=@(x) (x+3).^2+1;
df=@(x) 2*(x+3);

x=-10:0.1:5;
max_iter=20;
figure;
hold all;
plot(x,f(x))
theta_k1=5;
alpha=0.9;

while abs(df(theta_k1))>1e-3
  pause(0.1)
  theta_k=theta_k1-alpha*df(theta_k1);
  plot([theta_k1,theta_k],[f(theta_k1),f(theta_k)],'r-o','LineWidth',2)
  theta_k1=theta_k;
end

plot(theta,f(theta),'bo','LineWidth',2)
