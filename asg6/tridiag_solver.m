% Charishma Thota, cthota@ucsc.edu
% tridiag_solver.m: implements the Thomas algorithm to solve tridiagonal linear


function [x] = tridiag_solver(e,a,c,b)

%LUx = b

n= length(a);
x = zeros(n,1);
y = b;
% forward sub
for i = 2 : n
    B_i = e(i-1)/a(i-1);
    a(i) = a(i) - B_i*c(i-1);
    y(i) = b(i) - B_i*y(i-1);
    b = y;
end

%backward sub
x(n) = b(n)/a(n);

for j = n - 1 : -1 : 1
    mul = c(j) * x(j+1);
    x(j) = (y(j) - mul)/ a(j);
end 
end
