% Charishma Thota, cthota@ucsc.edu
% compute_factorial.m: computes and outputs the factorial of a number n

function [b] = compute_factorial(n)

count = n - 1; %create boundary 
b = n;
for y = 1:count
    s = n - y;
    b = b * s; %equation
end


