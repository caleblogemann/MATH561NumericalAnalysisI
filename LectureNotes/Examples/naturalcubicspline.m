function [a b c d] = naturalcubicspline(x,f)

% a + bx + cx^2 + dx^3

x = x(:); f = f(:); a = f; 
b=zeros(size(a)); c = b; d=b;

n = length(x)-1;

h = x(2:end) - x(1:end-1); 

alpha = 3*(a(3:end) - a(2:end-1))./h(2:end) ...
    -3*(a(2:end-1)-a(1:end-2))./h(1:end-1);

l = zeros(n+1,1);
mu = zeros(n+1,1);
z = zeros(n+1,1);
c =z;

l(1)=1; mu(1)=0; z(1)=0;

for i=1:n-1
    l(i+1) = 2*(x(i+2)-x(i))-h(i)*mu(i);
    mu(i+1) = h(i+1)/l(i+1);
    z(i+1) = (alpha(i)-h(i)*z(i))/l(i+1);
end

l(end) = 1; z(end)=0; c(end)=0;

for j=n-1:-1:0
    c(j+1) = z(j+1)-mu(j+1)*c(j+2);
    b(j+1) = (a(j+2)-a(j+1))/h(j+1)-h(j+1)*(c(j+2)+2*c(j+1))/3;
    d(j+1) = (c(j+2)-c(j+1))/(3*h(j+1));
end





