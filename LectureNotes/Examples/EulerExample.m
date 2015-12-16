clear all
close all

format long

%%%
% forward- and backward Euler for ODE
% dy/dt = lambda y, [0,1]
% y(0) = y_0

% check error
%%%

lambda = 2;
y0 = 1;

Error = []; %left: uf-y; right: ub-y

for N = [10 20 40 80 160 320]
    h = 1/N;
    x = [0:h:1];
    %exact solution
    y = y0*exp(lambda*x);
    %Forward Euler
    uf = zeros(1,N+1);
    %Backward Euler
    ub = zeros(1,N+1);
    
    uf(1) = y0;
    ub(1) = y0;
    
    for n = 1:N
        uf(n+1) = (1+h*lambda)*uf(n);
        ub(n+1) = ub(n)/(1-h*lambda);
    end
    
    plot(x,y,'r', x, uf, 'bo', x, ub, 'g*');
    Error = [Error; norm(uf-y,inf) norm(ub-y,inf)];
    
    pause
    
end

Error 
