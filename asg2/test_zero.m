% Charishma Thota, cthota@ucsc.eu
% test_zero.m: tests chord method some of this code was given by the the test_zero file on canvas

function [zc,ec,x,f] = test_zero()

fun = @(x) 16 * x.^5 - 20 * x.^3 + 5 * x;

tol = 1e-15;    % res tolerance
Nmax = 2 * 1e5; % max iterations = 20000
a = -0.99;      % first guess
b = -0.9;       % second guess


[z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax);

zc = z0;
ec = abs(his - cos(9 * pi/10));
x = linspace(-1,1,1000);
f = fun(x);

% plot function
figure(1)
plot(x, f)
title('f(x)');

% plot convergence history
figure(2)
semilogy(1:iter, ec)
title('Semilog plot of error');

% plot loglog
figure(3)
hold on
loglog( ec(1:iter-1), ec(2:iter) );

end