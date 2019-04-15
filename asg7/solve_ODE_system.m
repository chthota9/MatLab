% Charishma Thota, cthota@ucsc.edu
% solve_ODE_system.m: 

function [y,t]=solve_ODE_system()

NSTEPS=1e5;
DT= 1e-3;
IOSTEP=1;
y0=[1; 2; 3];

fun = @(y,t) [-y(1)+y(2)*y(3); -y(2)+(y(3)-2)*y(1); 1-y(1)*y(2)];

[y,t] = AB2(fun, y0, NSTEPS, DT, IOSTEP);


%PLOTTING
figure(1)
plot(t,y(1,:))
hold on
plot(t,y(2,:))
hold on
plot(t,y(3,:))

figure(2)
plot3(y(1,:), y(2,:), y(3,:))

end




