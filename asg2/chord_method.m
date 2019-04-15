% Charishma Thota, cthota@ucsc.edu
% chord_method.m: computes a zero

function [z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax)

x0 = (a+b)/2;
his(1) = x0;
iter = 1;
fun(a);
fun(b);

for k = 2:Nmax
    y = his(k-1);
    x = y - (((b -a)/(fun(b) - fun(a)))*fun(y));
        if(abs(x-y) < tol)
            iter = iter + 1;
            his(k) = x;
            z0 = x;
            res = abs(fun(z0));
            return;
        end
        if(abs(x-y) > tol)
            iter = iter + 1;
            his(k) = x;
        end
    end
    z0 = x;
    res = abs(fun(z0));
    
end


