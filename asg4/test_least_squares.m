% Charishma Thota, cthota@ucsc.edu
% test_least_squares.m: tests using the least square method

function [x,p1,p2,p4,p8] = test_least_squares()

x=linspace(0,1,1000);
d = load ('DJI_2014_2019.dat');
xi = d(:,1);
yi = d(:,2);

M = 1;
[a,err] = poly_least_squares(xi,yi,M)
func = @(y) 0;
n = length(a);
for i = 0 : (n-1)
    func = @(y) func(y) + (a(i+1) * y.^(i));
end
%fun
p1 = func(x);
 
%plot p1
figure(1)
plot(xi,yi,'b')
hold on
plot(x,p1,'r')

M = 2;
[a,err] = poly_least_squares(xi,yi,M)
func2 = @(y2) 0;
n = length(a);
for i = 0 : (n-1)
    func2 = @(y2) func2(y2) + (a(i+1) * y2.^(i));
end
%fun
p2 = func2(x);
 
%plot p2
figure(1)
plot(xi,yi,'b')
hold on
plot(x,p2,'r')

M = 4;
[a,err] = poly_least_squares(xi,yi,M)
func3 = @(y3) 0;
n = length(a);
for i = 0 : (n-1)
    func3 = @(y3) func3(y3) + (a(i+1) * y3.^(i));
end
%fun
p4 = func3(x);
 
%plot p4
figure(1)
plot(xi,yi,'b')
hold on
plot(x,p4,'r')

M = 8;
[a,err] = poly_least_squares(xi,yi,M)
func4 = @(y4) 0;
n = length(a);
for i = 0 : (n-1)
    func4 = @(y4) func4(y4) + (a(i+1) * y4.^(i));
end
%fun
p8 = func4(x);
 
%plot p8
figure(1)
plot(xi,yi,'b')
hold on
plot(x,p8,'r')


end