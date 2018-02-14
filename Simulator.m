clear
close all

dt=0.4; %simulation step time in seconds
N=300; %simulation steps
u=[ones(1,N); ones(1,N)./10];
S_X_t=zeros(3,N);
S_X_e_t=zeros(3,N);
S_X_t(:,1)=[0 0 0];
S_X_e_t(:,1)=[0 0 0];
for i=2:N
    [X, X_e]=SurfaceVehicle(S_X_t(:,i-1), u(1, i), u(2, i), dt);
    S_X_t(:,i)=X;
    S_X_e_t(:,i)=X_e;
end

L=0.001;
hold on
plot (  S_X_t(1,:),   S_X_t(2,:) ,'o',  ...
        S_X_t(1,:)+L*cos(S_X_t(3,:)),   S_X_t(2,:)+L*sin(S_X_t(3,:)) ,'.')
    
plot (  S_X_e_t(1,:),   S_X_e_t(2,:) ,'o',  ...
        S_X_e_t(1,:)+L*cos(S_X_e_t(3,:)),   S_X_e_t(2,:)+L*sin(S_X_e_t(3,:)) ,'.')