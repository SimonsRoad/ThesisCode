function [ dX ] = UUV(dt, X_p,FLAG, u)
%UUV Simulation of Underwater Vehicle movement, given a linear velocity and
%angular velocities (pitch roll and yaw)
%   Inputs:
%       X_p - previous state vector [x, y, z, theta_y, theta_p, theta_r]
%       v -linear velocity
%       omega_p - pitch angular velocity
%       omega_r - roll angular velocity
%       omega_y - yaw angular velocity
%       dt - time of movement
%   Outputs:
%       dX - state derivate

dX=zeros(6,1);
dX(1)=u(1)*cos(X_p(5))*cos(X_p(6));
dX(2)=u(1)*cos(X_p(5))*sin(X_p(6));
dX(3)=u(1)*sin(X_p(5)); 
dX(4)=u(2);
dX(5)=u(3);
dX(6)=u(4);
end

