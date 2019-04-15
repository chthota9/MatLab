% Charishma Thota, cthota@ucsc.edu
% compute_Euclidean_norm.m: computes and outputs the norm of a vector

function [z] = compute_Euclidean_norm(x)

l= length(x); %calculates length
n = 0;
for y = 1:l %does it until length
    n = n + (x(y)^2); % equation
end
z = sqrt(n);








