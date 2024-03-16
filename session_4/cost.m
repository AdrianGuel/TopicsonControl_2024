% Least squares value from error in linear system
% Guel Cortez 2024
function least_squares=cost(gains,end_time,sys_params)
    m=sys_params(1);
    b=sys_params(2);
    s = tf('s');
    P=1/(s*(m*s+b));
    C=gains(1)+gains(2)*s;
    T=feedback(P*C,1);
    [y,t]=step(T,end_time);
    least_squares=sum((y-1).^2);
end
