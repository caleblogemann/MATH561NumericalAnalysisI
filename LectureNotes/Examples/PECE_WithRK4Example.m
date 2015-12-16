clear all
close all

format long

%%%
% Four-Stage RK for ODE
% Predictor-Corrector
% 4-th order Adams-Bashford
% 4-th order Adams-Moulton
% dy/dt = lambda y, [0,1]
% y(0) = y_0

% check error
%%%

lambda = 2;
y0 = 1;

  
% four-state RK method for initialization
alpha1 = 1/6;
alpha2 = 1/3;
alpha3 = 1/3;
alpha4 = 1/6;
lambda21 = 1/2;
lambda31 = 0;
lambda32 = 1/2;
lambda41 = 0;
lambda42 = 0;
lambda43 = 1;
mu2 = lambda21;
mu3 = lambda31+lambda32; 
mu4 = lambda41+lambda42+lambda43;

% 4-th order Adams-Bashford 



Error = []; 

for N = [10 20 40 80 160 320 640]
    h = 1/N;
    x = [0:h:1];
    %exact solution
    y = y0*exp(lambda*x);
    %Improved Euler
    uf = zeros(1,N+1); 
    
    uf(1) = y0; 
    
    for n = 1:3
        k1 = lambda*uf(n);
        k2 = lambda*(uf(n)+lambda21*h*k1);
        k3 = lambda*(uf(n)+lambda31*h*k1+lambda32*h*k2);
        k4 = lambda*(uf(n)+lambda41*h*k1+lambda42*h*k2+lambda43*h*k3);
        uf(n+1) = uf(n)+h*(alpha1*k1+alpha2*k2+alpha3*k3+alpha4*k4); 
    end
    
    for n=5:N+1
        %predictor
        k1 = lambda*uf(n-1);
        k2 = lambda*uf(n-2);
        k3 = lambda*uf(n-3);
        k4 = lambda*uf(n-4);
        uf_star = uf(n-1) + h/24*(55*k1-59*k2+37*k3-9*k4);
        
        %corrctor
        k_star = lambda*uf_star;
        uf(n) = uf(n-1) + h/24*(9*k_star+19*k1-5*k2+k3);
        
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 