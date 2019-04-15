% Charishma Thota, cthota@ucsc.edu
% Lagrange_interpolation.m: computes the langrage interpolation

function [y] = Lagrange_interpolation(xi,yi,x)

n = size(xi,2);
p = size(yi,2);
y=0;

if (n == p)
for i=1:n
      Lag = 1;
      for j=1:n
         if (i~=j)
            Lag=Lag.*(x-xi(j))/(xi(i)-xi(j));
         end
      end
      y=y+yi(i)*Lag;
end 
else
y=NaN;
end
end