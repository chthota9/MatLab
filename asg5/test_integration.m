% Charishma Thota, cthota@ucsc.edu
% test_integration.m: uses the composite trapezodial rule

function [em,et,es] = test_integration()

I_Ref = 1.6851344770476;

fun = @(x) ((1./(1 + x.^2)).*cos((3/2).*e.^(-x.^2))) - (x.^3/30);
b = 1;
a = -3;
n = 100;
em = zeros(1,n);
et = zeros(1,n);
es = zeros(1,n);
x = linspace(-3,1,1000);
d = linspace(2,100);
f = fun(x);

for i = 2 : 100
    [I1]=int_midpoint_rule(fun,a,b,i)
    em(1,i-1)= abs(I_Ref - I1);
end

for i2 = 2 : 100
    [I2]=int_trapezodial_rule(fun,a,b,i2)
    et(1,i2-1)= abs(I_Ref - I2);
end

for i3 = 2 : 100
    [I3]=int_Simpson_rule(fun,a,b,i3)
    es(1,i3-1)= abs(I_Ref - I3);
end

 
%plot
figure(1)
plot(x,f)

%plot
figure(2)
loglog(d,em)
hold on
loglog(d,et)
hold on
loglog(d,es)

end