clear
close all

t=180; %simulation time in seconds
dt=0.4; %simulation step time in seconds
N=round(t/dt); %simulation steps
RATE=1; %refresh draw rate
u_sv=[ones(1,N); ones(1,N)./30];
SV_X_t=zeros(3,N);
SV_X_e_t=zeros(3,N);
SV_X_t(:,1)=[0 0 0];
SV_X_e_t(:,1)=[0 0 0];

u_uuv=[ones(1,N); zeros(1,N); -1.*ones(1,N/2)./1000 , ones(1,N/2)./1000 ;ones(1,N)./30]; 
UUV_X_t=zeros(6,N);
UUV_X_e_t=zeros(6,N);

for i=2:N
    [X, X_e]=SV_Location(dt, SV_X_t(:,i-1), u_sv(1, i), u_sv(2, i));
    SV_X_t(:,i)=X;
    SV_X_e_t(:,i)=X_e;
    [X, X_e]=UUV_Location(dt, UUV_X_t(:,i-1), UUV_X_e_t(:,i-1), u_uuv(1 ,i), u_uuv(2 ,i), u_uuv(3 ,i), u_uuv(4 ,i));
    UUV_X_t(:,i)=X;
    UUV_X_e_t(:,i)=X_e;
end

L=0.1;
figure('Name','Surface Vehicle Path')
minX = min(min(SV_X_t(1,:)), min(SV_X_e_t(1,:)));
maxX = max(max(SV_X_t(1,:)), max(SV_X_e_t(1,:)));
minY = min(min(SV_X_t(2,:)), min(SV_X_e_t(2,:)));
maxY = max(max(SV_X_t(2,:)), max(SV_X_e_t(2,:)));
axis([minX, maxX, minY, maxY]);
SVPath = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'b');
SVTheta = animatedline('LineStyle', 'none', 'Marker', '.', 'Color', 'b');
SVEPath = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'r');
SVETheta = animatedline('LineStyle', 'none', 'Marker', '.', 'Color', 'r');

a = tic; % start timer
for k = 1:N
    addpoints(SVPath, SV_X_t(1,k), SV_X_t(2,k))
    addpoints(SVTheta, SV_X_t(1,k)+L*cos(SV_X_t(3,k)),   SV_X_t(2,k)+L*sin(SV_X_t(3,k)))
    addpoints(SVEPath, SV_X_e_t(1,k), SV_X_e_t(2,k))
    addpoints(SVETheta, SV_X_e_t(1,k)+L*cos(SV_X_e_t(3,k)),   SV_X_e_t(2,k)+L*sin(SV_X_e_t(3,k)))
    b = toc(a); % check timer
    if b > (1/RATE) 
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end

figure('Name','Underwater Vehicle Path')

minX = min(min(UUV_X_t(1,:)), min(UUV_X_e_t(1,:)));
maxX = max(max(UUV_X_t(1,:)), max(UUV_X_e_t(1,:)));
minY = min(min(UUV_X_t(2,:)), min(UUV_X_e_t(2,:)));
maxY = max(max(UUV_X_t(2,:)), max(UUV_X_e_t(2,:)));
subplot(2,1,1)
axis([minX, maxX, minY, maxY])
UUVPath = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'b');
UUVTheta = animatedline('LineStyle', 'none', 'Marker', '.', 'Color', 'b');
UUVEPath = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'r');
UUVETheta = animatedline('LineStyle', 'none', 'Marker', '.', 'Color', 'r');

minY = min(min(UUV_X_t(3,:)), min(UUV_X_e_t(3,:)));
maxY = max(max(UUV_X_t(3,:)), max(UUV_X_e_t(3,:)));
subplot(2,1,2)
axis([0, N, minY, maxY])
UUVDepth = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'b');
UUVEDepth = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'r');

a = tic; % start timer
for k = 1:N
    addpoints(UUVPath, UUV_X_t(1,k), UUV_X_t(2,k))
    addpoints(UUVTheta, UUV_X_t(1,k)+L*cos(UUV_X_t(3,k)),   UUV_X_t(2,k)+L*sin(UUV_X_t(3,k)))
    addpoints(UUVEPath, UUV_X_e_t(1,k), UUV_X_e_t(2,k))
    addpoints(UUVETheta, UUV_X_e_t(1,k)+L*cos(UUV_X_e_t(6,k)),   UUV_X_e_t(2,k)+L*sin(UUV_X_e_t(6,k)))

    addpoints(UUVDepth, k, UUV_X_t(3,k))
    addpoints(UUVEDepth, k, UUV_X_e_t(3,k))
    b = toc(a); % check timer
    if b > (1/RATE) 
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end

figure('Name','3D Underwater Vehicle Path')
minX = min(min(UUV_X_t(1,:)), min(UUV_X_e_t(1,:)));
maxX = max(max(UUV_X_t(1,:)), max(UUV_X_e_t(1,:)));
minY = min(min(UUV_X_t(2,:)), min(UUV_X_e_t(2,:)));
maxY = max(max(UUV_X_t(2,:)), max(UUV_X_e_t(2,:)));
minZ = min(min(UUV_X_t(3,:)), min(UUV_X_e_t(3,:)));
maxZ = max(max(UUV_X_t(3,:)), max(UUV_X_e_t(3,:)));
axis([minX, maxX, minY, maxY, minZ, maxZ])
UUV3D  = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'b');
UUV3DE  = animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'r');
view(3);
a = tic; % start timer
for k = 1:N
    addpoints(UUV3D, UUV_X_t(1,k), UUV_X_t(2,k), UUV_X_t(3,k))
    addpoints(UUV3DE, UUV_X_e_t(1,k), UUV_X_e_t(2,k), UUV_X_e_t(3,k))
    b = toc(a); % check timer
    if b > (1/RATE) 
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end