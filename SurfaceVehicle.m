function [X, X_e] = SurfaceVehicle(X_p, v, omega, dt)
%SurfaceVehicle - Simulation of movement of a surface vehicle
%   Given linear and angular velocities (v, omega) calculates the next pose of
%   the vehicle. The function also returns as estimated pose considering
%   GPS errors
%   INPUTS
%       v - linear velocity
%       omega - angular velocity
%       dt - simulation step time
%
%   OUTPUTS
%       X - state vector [x, y, theta]
%       X_e - estimated state vector [x_e, _y_e, theta_e]
X=zeros(3,1);
X(1)=X_p(1)+v*cos(X_p(3)+omega*dt/2)*dt; 
X(2)=X_p(2)+v*sin(X_p(3)+omega*dt/2)*dt; 
X(3)=X_p(3)+omega*dt;

X_e=X+rand(3,1)*0.5;
end

