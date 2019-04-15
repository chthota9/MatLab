% Charishma Thota, cthota@ucsc.edu
% AB2.m: ucomputes the numerical solution of (1) by using the two-step Adams-Bashforth (AB2) scheme

function [y,t] = AB2(fun,y0,NSTEPS,DT,IOSTEP)

%intialize our variables
y = y0;
t0 = 0;
TI = t0;
S= floor(NSTEPS/IOSTEP) + 1;
t  = [t0];


u0 = y0;
t1 = DT + t0;
ti = t1;


u1 = y0 + (DT/2)*(fun(y0,t0) + fun(y0 + (DT* fun(y0,t0)),t1));
y1 = u1;%store value to keep updating in the future

for i  = 2 : NSTEPS
    if IOSTEP == 1 && i == 2 %if IOSTEP = 1, then you have to store u1
        y = [y u1];  
        t = [t t1];
    end

    ti = ti + DT;
    u_n_plus_1 = y1 + (DT/2)*(3 * fun(y1,ti) - fun(y0,TI));
    
    y0 = y1;
    y1 = u_n_plus_1;
    TI = ti;

    if mod(i,IOSTEP) == 0 %for all IOSTEPS
        y = [y y1]; 
        t = [t ti+DT];
    end
end


