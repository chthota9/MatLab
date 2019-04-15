% Charishma Thota, cthota@ucsc.edu
% pi_series.m: computes and outputs computes the  retuns the first 15 partial sums of the series 

function [P,n,p]=pi_series()
P = [];
sum = 0;

for n = 0:14 %outer for moving down 15 numbers
    for k = 0:n % inner for equation
        sum = sum + (((-1)^k) * ((1/((6*k)+1))+(1/((6*k)+5)))); %equation
        end
        P(n+ 1) = 3 * sum;
        sum = 0;
    end

