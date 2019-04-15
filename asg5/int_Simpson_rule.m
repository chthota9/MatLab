% Charishma Thota, cthota@ucsc.edu
% int_Simpson_rule.m: uses the composite trapezodial rule

function [I]=int_Simpson_rule(fun,a,b,n) 

h = (b-a)/(n-1);
x = zeros(1,n);
sum = 0;
x(1,1) = a;

for j = 2 : n
    x(1,j) = a + ((j - 1) * h);
end

for i = 2 : n
    f_bar = (x(1,i) + x(1,i-1)) / 2;
    hold1 = fun(x(1,i-1));
    hold2 = 4 * fun(f_bar);
    hold3 = fun(x(1,i));
    hold = hold1 + hold2 + hold3;
    sum = sum + hold;
end

I = sum * (h/6);

end