% Charishma Thota, cthota@ucsc.edu
% int_trapezodial_rule.m: uses the composite trapezodial rule

function [I]=int_trapezodial_rule(fun,a,b,n) 

h = (b-a)/(n-1);
x = zeros(1,n);
sum = 0;
x(1,1) = a;

for j = 2: n
    x(1,j) = a + ((j - 1) * h);
end

for i = 2 : n
    hold1 = fun((x(1,i-1)));
    hold2 = fun((x(1,i)));
    hold = (hold1 + hold2) / 2;
    sum = sum + hold;
end

I = sum * h;
end