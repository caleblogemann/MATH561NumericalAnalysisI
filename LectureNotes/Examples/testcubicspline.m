clear all
close all


f = @(x) exp(x);

x0 = linspace(-1,4,1001); y0 = f(x0);

x = [0 1 2 3];
y = f(x);


figure(1)
plot(x0,y0,'r',x,y,'o');

n = length(x);

%natural cubic spline
p_nat = csape(x,y,'variational');

for j=1:n-1
    xx = linspace(x(j),x(j+1),101);
    yy = polyval(p_nat.coefs(j,:), xx - p_nat.breaks(j));
    figure(1)
    hold on
    plot(xx,yy,'g');
    hold off
end

 

%clamped cubic spline
x = [1 2 3]; y = [2 3 5];
v = [2 1];

p_cla = csape(x,y,'clamped',v);

figure(2)
plot(x,y,'o');

n = length(x);
for j=1:n-1
    xx = linspace(x(j),x(j+1),101);
    yy = polyval(p_cla.coefs(j,:), xx - p_cla.breaks(j));
    figure(2)
    hold on
    plot(xx,yy,'g');
    hold off
end


%[d c b a] = naturalcubicspline(x,y);

%[d c b a] = clampedcubicspline(x,y,v(1),v(2));


