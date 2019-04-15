% Charishma Thota, cthota@ucsc.edu
% Lebesgue_constants_and_errors.m: test the Langrage interpolator

function [L1,L2,L3,L4,e1,e2,e3,e4]=Lebesgue_constants_and_errors()
fun = @(x) 1./(1 + (sin(2 * pi * x).^2));

x=linspace(-1,1,1000);
f = fun(x);

i1 = 1;
for j=0:14
    xi1(i1) = (-1 + (2 * ((j)./14)));
    i1 = i1 + 1;
end
[lambda1,L1]=compute_Lebesgue_function(xi1,x)
yi1 = fun(xi1);
[y1] = Lagrange_interpolation(xi1,yi1,x);
e1 = max(abs(f-y1))

% plot function
figure(1)
plot(x,lambda1,'r')
title('L1');


i2 = 1;
for j=0:40
    xi2(i2) = (-1 + (2 * ((j)./40)));
    i2 = i2 + 1;
end
[lambda2,L2]=compute_Lebesgue_function(xi2,x)
yi2 = fun(xi2);
[y2] = Lagrange_interpolation(xi2,yi2,x);
e2 = max(abs(f-y2))

% plot function
figure(2)
plot(x,lambda2,'r')
title('L2');


i3 = 1;
for j=0:14
    xi3(i3)  = (cos((pi/(14)) .* (j)));
    i3 = i3 + 1;
end
[lambda3,L3]=compute_Lebesgue_function(xi3,x)
yi3 = fun(xi3);
[y3] = Lagrange_interpolation(xi3,yi3,x);
e3 = max(abs(f-y3))

% plot function
figure(3)
plot(x,lambda3,'r')
title('L3');


i4 = 1;
for j=0:40
    xi4(i4)  = (cos((pi/(40)) .* (j)));
    i4 = i4 + 1;
end
[lambda4,L4]=compute_Lebesgue_function(xi4,x)
yi4 = fun(xi4);
[y4] = Lagrange_interpolation(xi4,yi4,x);
e4 = max(abs(f-y4))

% plot function
figure(4)
plot(x,lambda4,'r')
title('L4');

end
