% Charishma Thota, cthota@ucsc.edu
% backward_sum.m: uses the bacward sub to compute upper triangular system

function [x] = backward_sub(U,b)

n = length(b);
x = zeros(n,1);

x(n) = b(n)/U(n,n);
x(n-1) = (b(n-1)-(U(n-1,n) * x(n)))/ U(n-1,n-1);
f=n-2;
summation = 0;


 
for k = f : -1 : 1 
 
    for j = n : -1 : k - 1
        if j  == 0
           break;
        end
        summation = summation + (U(k,j) * x(j));
    end
    x(k) = (b(k) - summation)/U(k,k);
    summation = 0;
end

end
