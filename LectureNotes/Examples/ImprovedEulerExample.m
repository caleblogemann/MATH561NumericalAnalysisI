clear all
close all

format long

%%%
% Improved Euler for ODE
% dy/dt = lambda y, [0,1]
% y(0) = y_0

% check error
%%%

lambda = 2;
y0 = 1;


%Mid-point rule
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
        k2 = lambda*(uf(n)+0.5*h*k1);
        uf(n+1) = uf(n)+h*k2; 
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 



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
        k2 = lambda*(uf(n)+h*k1);
        uf(n+1) = uf(n)+0.5*h*(k1+k2); 
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 

%% general two-state method
alpha2 = 3/4;
alpha1 = 1-alpha2;
mu = 1/(2*alpha2);


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
        k2 = lambda*(uf(n)+mu*h*k1);
        uf(n+1) = uf(n)+h*(alpha1*k1+alpha2*k2); 
    end
    
    plot(x,y,'r', x, uf, 'bo');
    Error = [Error; norm(uf-y,inf)];
    
    pause
    
end

Error 

