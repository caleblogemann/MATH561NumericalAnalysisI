clear all
close all

format long

%%%
% 2nd order method based on taylor expansion
% y' = x^2 sin(y), [0, 1]
% y(0) = y_0
%%%


y0 = 1;

%reference sol on very refined mesh
N = 3200;

h = 1/N;
x = [0:h:1];
%Forward, 2nd-order
uf = zeros(1,N+1);
uf(1) = y0;
for n = 1:N
    uf(n+1) =  uf(n) + h*x(n)^2*sin(uf(n)) + 1/2*h^2*(2*x(n)*sin(uf(n)) + x(n)^4 *cos(uf(n))*sin(uf(n)));
end
ue = uf; xe = x;

figure
plot(xe,ue,'r');
%hold on 
pause



for N = [10 20 40 80 160]
    
    h = 1/N;
    x = [0:h:1]; 
    %Forward, 2nd-order
    uf = zeros(1,N+1); 
    
    uf(1) = y0; 
    
    for n = 1:N
        uf(n+1) =  uf(n) + h*x(n)^2*sin(uf(n)) + 1/2*h^2*(2*x(n)*sin(uf(n)) + x(n)^4 *cos(uf(n))*sin(uf(n))); 
    end
    
    plot(xe,ue,'r', x, uf,'bo');
    pause
    
end