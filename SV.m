function [dX] = SV(dt, X_p, FLAG, u)
%SV - Simulation of movement of a surface vehicle
%   Given linear and angular velocities (v, omega) calculates the next pose of
%   the vehicle. The function also returns as estimated pose considering
%   GPS errors
%   INPUTS
%       v - linear velocity
%       omega - angular velocity
%       dt - simulation step time
%
%   OUTPUTS
%       dX - dX/dt

dX=zeros(3,1);
dX(1)=u(1)*cos(X_p(3)); 
dX(2)=u(1)*sin(X_p(3)); 
dX(3)=u(2);
end

