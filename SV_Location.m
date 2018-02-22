function [X X_e] = SV_Location(dt, X_p, v, omega)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
TSPAN = [0, dt];
[T X] = ode45('SV', TSPAN, X_p, [], [v omega]);
X=X(size(X,1),:)';
X_e=X+(rand(3,1)-ones(3,1).*0.5);
end

