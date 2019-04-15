% Charishma Thota, cthota@ucsc.edu
% compute_Lebesgue_function.m: test the Langrage interpolator

function [lambda,L]= compute_Lebesgue_function(xi,x)

n = length(xi);
lambda = 0;
for j = 1 : n
    Lag = 1;
    for i = 1 : n
        if i~=j
            Lag = Lag .* (x-xi(i))./(xi(j)-xi(i));
        end
    end
    lambda = lambda + abs(Lag);
end 
L = max(lambda);
end
