clear all
close all

f = @(x) 1./(1+25*x.^2);

xmin = -1; xmax = 1;

xx = linspace(xmin,xmax,200); 

figure(1)
plot(xx, f(xx), 'r');


for n = [10 20 30]
    x = linspace(xmin,xmax,n);
    yy = lagrangepoly(x,f(x),xx);
    
    figure(1)
    hold on
    plot(x,f(x),'o',xx,yy,'b')
    hold off
    pause
end

return

%data fitting
xx = linspace(-1,1,11);
yy = f(xx);
cftool
% figure(2)
% plot(xx, yy, 'o')


return

%chebyshev
figure(3)
xx = linspace(xmin,xmax,200); 
plot(xx, f(xx), 'r');

for n =  [10 20 30]
    K = [1:n];
    x = cos((2*K-1)/(2*n)*pi);
    y = f(x);
    
    yy = lagrangepoly(x,f(x),xx);
    
    figure(3)
    hold on
    plot(x,y,'o', xx,yy,'b');
    hold off
    pause
end
