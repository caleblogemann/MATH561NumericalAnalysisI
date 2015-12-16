clear all
close all

format long

addpath('./chebfun');

xmin = -1; xmax = 1;
xx = linspace(xmin,xmax,101);

%given function
f = @(s) 1./(1+25*s.^2);


%%%%%%chebyshev polynomial expansion
%chebyshev coefficients
x = chebfun('x');
p = f(x);
a = chebpoly(p)'; a = a(end:-1:1);

%TEST
n = 15;  % first (n+1) chebyshev coefficients used
nnn = 15; % nubmer of nodes used in langrange poly interpolation

%chebyshev poly expansion
syms x real
cheby = chebyshevT([0:n],x); %generate chebyshev polynomials

w = 1/sqrt(1-x^2); % weight function

c = a(1:n+1);  %chebyshev coefficients used
chebyf = cheby*c;  %chebyshev expansion of f
chebyf = @(x) eval(chebyf);


%%%lagrange interpolation on equally spaced nodes
xxx = linspace(xmin,xmax,nnn);
[P R S] = lagrangepoly(xxx,f(xxx));
yy = polyval(P,xx);

%%%lagrange interpolation on chebyshev nodes
K = [1:nnn];
xc = cos((2*K-1)/(2*nnn)*pi);
yc = f(xc);
    
yyc = lagrangepoly(xc,f(xc),xx);

%plot
plot(xx,f(xx), 'r', xx, chebyf(xx), 'bo',xxx, f(xxx),'go', xx, yy,'g',xc, yc, 'kd', xx,yyc,'k');
legend('Exact','Cheby Expansion','Equally-Spaced Nodes','Lag on Equally-Spaced Nodes', ... 
    'Chebyshev Nodes', 'Lag on Chebyshev Nodes','Location', 'NorthEast');

