% Charishma Thota, cthota@ucsc.edu
% test_Lagrange_interpolation.m: test the Langrage interpolator

function [x,f,P1,P2,P3,P4]=test_Lagrange_interpolation()

fun = @(x) 1./(1 + (sin(2 * pi * x).^2));

x = linspace(-1,1,1000)
f = fun(x)

i1 = 1;
for j=0:14
    xi1(i1) = (-1 + (2 * ((j)./14)));
    i1 = i1 + 1;
end
yi1 = fun(xi1);
[y] = Lagrange_interpolation(xi1,yi1,x);
P1  =  y

% plot function
figure(1)
plot(x,f,'b')
title('f(x) and P1');
hold on 
plot(x,P1,'r')

i2 = 1;
for j = 0:40
    xi2(i2)  = (-1 + (2 * ((j)./40)));
    i2 = i2 + 1;
end
yi2 = fun(xi2);
[y] = Lagrange_interpolation(xi2,yi2,x);
P2  = y

% plot function
figure(2)
plot(x,f,'b')
hold on
plot(x,P2, 'color', 'red')

i3 = 1;
for j=0:14
    xi3(i3)  = (cos((pi/(14)) .* (j)));
    i3  = i3 + 1;
end
yi3 = fun(xi3);
[y] = Lagrange_interpolation(xi3,yi3,x);
P3  = y

% plot function
figure(3)
plot(x,f,'b')
hold on
plot(x,P3, 'color', 'red')

i4 = 1;
for j=0:40
    xi4(i4)  = (cos((pi./(40)) * (j)));
    i4  = i4 + 1;
end

yi4 = fun(xi4);
[y] = Lagrange_interpolation(xi4,yi4,x);
P4  = y

% plot function
figure(4)
plot(x,f,'b')
hold on
plot(x,P4, 'color', 'red')


end










