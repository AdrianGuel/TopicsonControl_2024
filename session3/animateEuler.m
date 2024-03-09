function animateEuler()
    % Parameters
    close all;
    dt = 0.01; % Time step
    tspan = [0 10]; % Time span
    initialConditions = [0; 2]; % Initial conditions [x0; v0]
    
    % Function representing the second-order differential equation: x'' = -x
    odeFunc = @(t, y, u) [y(2); -3*y(1)-0.3*y(2)+u]; 
    
    % Initialize
    t = tspan(1):dt:tspan(2);
    y = zeros(2, length(t));
    y(:,1) = initialConditions;
    
    % Euler method
    for i = 1:length(t)-1
        u=5*(3-y(1,i))+10*(0-y(2,i));%full state feedback control
        y(:,i+1) = y(:,i) + dt * odeFunc(t(i), y(:,i),u);
    end
    
    % Animation
    figure;
    %axis([-2 2 -2 2]);
    xlabel('x');
    ylabel('y');
    title('Euler Method Animation for Second Order ODE');
    hold on;
    plot(y(1,1), y(2,2), 'r.'); % Initial position
    
    for i = 1:length(t)
        plot(y(1,i), y(2,i), 'r.'); % Plot current position
        pause(dt);
        if i < length(t)
            plot([y(1,i), y(1,i+1)], [y(2,i), y(2,i+1)], 'b--'); % Plot trajectory
        end
    end
end
