function [ X, X_e] = UUV_Location(dt, X_p, X_p_e, v, omega_p, omega_r, omega_y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
TSPAN = [0, dt];
error=(rand(1, 4)-ones(1,4).*0.5)*[0.1 0.05, 0.0005, 0.05]';
[~, X1] = ode45('UUV', TSPAN, X_p, [], [v omega_p omega_r omega_y]);
X=X1(size(X1,1),:)';

[~, X1] = ode45('UUV', TSPAN, X_p_e, [], [v omega_p omega_r omega_y]+error);
X_e=X1(size(X1,1),:)';

end

