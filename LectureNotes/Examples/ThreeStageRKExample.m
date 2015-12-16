clear all
close all

format long

%%%
% Three-Stage RK for ODE
% dy/dt = lambda y, [0,1]
% y(0) = y_0

% check error
%%%

lambda = 2;
y0 = 1;

  
%% three-state method 1
alpha1 = 1/4;
alpha2 = 0;
alpha3 = 3/4;
lambda21 = 1/3;
lambda31 = 0;
lambda32 = 2/3;
mu2 = lambda21;
mu3 = lambda31+lambda32; 

pause
close all
%trapezoidal rule
Error = []; 

for N = [10 20 40 80 160 320]
    h = 1/N;
    x = [0:h:1];
    %exact solution
    y = y0*exp(lambda*x);
    %Improved Euler
    uf = zeros(1,N+1); 
    
    uf(1) = y0; 
    
    for n = 1:N
        k1 = lambda*uf(n);
        k2 = lambda*(uf(n)+lambda21*h*k1);
        k3 = lambda*(uf(n)+lambda31*h*k1+lambda32*h*k2);
        uf(n+1) = uf(n)+h*(alpha1*k1+alpha2*k2+alpha3*k3); 
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 


%% three-state method 2
alpha1 = 1/6;
alpha2 = 2/3;
alpha3 = 1/6;
lambda21 = 1/2;
lambda31 = -1;
lambda32 = 2;
mu2 = lambda21;
mu3 = lambda31+lambda32; 

pause
close all
%trapezoidal rule
Error = []; 

for N = [10 20 40 80 160 320]
    h = 1/N;
    x = [0:h:1];
    %exact solution
    y = y0*exp(lambda*x);
    %Improved Euler
    uf = zeros(1,N+1); 
    
    uf(1) = y0; 
    
    for n = 1:N
        k1 = lambda*uf(n);
        k2 = lambda*(uf(n)+lambda21*h*k1);
        k3 = lambda*(uf(n)+lambda31*h*k1+lambda32*h*k2);
        uf(n+1) = uf(n)+h*(alpha1*k1+alpha2*k2+alpha3*k3); 
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 

