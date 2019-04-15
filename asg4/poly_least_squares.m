% Charishma Thota, cthota@ucsc.edu
% poly_least_squares.m: computes using the least square method

function [a,err] = poly_least_squares(xi,yi,M)

n = length(xi);
B = ones(n,M + 1);
co = 1;
sq = 1;

for i = 1 : n
    for j = 2: M + 1
        B(i,j) = (xi(co))^sq;
        sq = sq + 1;
    end
    co = co + 1;
    sq = 1;
end
T = transpose(B);
A = T * B;
P = A\T;
row_yi = size(yi,1);
if row_yi == 1
    t_yi = transpose(yi);
    a = P * t_yi;
else
    a = P * yi;
end

o = length(a);

total = 0;
R = ones(1,n);
err = 0; 
inc = 1;
row = size(B,1);
col = size(B,2);

for s = 1 : row
    for t = 1 : col
            B(s,t);
            a(inc);
            total = total + (B(s,t) * a(inc));
            inc = inc + 1;    
    end
    inc = 1;
    R(1,s) = total;
    total = 0;
end
d = length(R);

for w = 1 : d
    R(1,w) = yi(w) - R(1,w);
end

err = 0;
for l = 1 : d
    R(1,l) = R(1,l) * R(1,l);
    err = err + R(1,l);
end

err
end