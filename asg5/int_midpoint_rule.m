% Charishma Thota, cthota@ucsc.edu
% int_midpoint_rule.m: uses the composite midpoint rule

function [I]=int_midpoint_rule(fun,a,b,n) 

h = (b-a)/(n-1);
x = zeros(1,n);
sum = 0;
x(1,1) = a;

for j = 2: n
    x(1,j) = a + ((j - 1) * h);
end

for i = 2 : n
    hold = (x(1,i) + x(1,i-1)) / 2;
    sum = sum + fun(hold);
end

I = sum * h;

end


