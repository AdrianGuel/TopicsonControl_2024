function lorentzRK4()
    % Parameters
    sigma = 10;
    beta = 8/3;
    rho = 28;
    
    % Initial conditions
    x0 = 0;
    y0 = 1;
    z0 = 1.05;
    
    % Time span
    tspan = [0 50];
    t = tspan(1):0.01:tspan(2);
    
    % Solve using Runge-Kutta method
    [t,xyz] = rk4(@(t,xyz) lorentzODE(t,xyz,sigma,beta,rho), tspan, [x0; y0; z0]);
    
    % Plotting
    figure;
    plot3(xyz(1,:), xyz(2,:), xyz(3,:));
    xlabel('x'); ylabel('y'); zlabel('z');
    title('Lorentz System Solution using RK4');
    grid on;
end

function dxyzdt = lorentzODE(~, xyz, sigma, beta, rho)
    x = xyz(1);
    y = xyz(2);
    z = xyz(3);
    dxdt = sigma * (y - x);
    dydt = x * (rho - z) - y;
    dzdt = x * y - beta * z;
    dxyzdt = [dxdt; dydt; dzdt];
end

function [t, xyz] = rk4(odefun, tspan, y0)
    % Fourth-order Runge-Kutta method
    h = 0.01; % Step size
    t = tspan(1):h:tspan(2);
    n = length(t);
    xyz = zeros(length(y0), n);
    xyz(:,1) = y0;
    for i = 1:n-1
        k1 = h * odefun(t(i), xyz(:,i));
        k2 = h * odefun(t(i) + h/2, xyz(:,i) + k1/2);
        k3 = h * odefun(t(i) + h/2, xyz(:,i) + k2/2);
        k4 = h * odefun(t(i) + h, xyz(:,i) + k3);
        xyz(:,i+1) = xyz(:,i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end
