%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Homework 5 problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
omega = 1;
%omega = 10;
%omega = 50;
% setup exact solutions for both cases
y1 = @(x) x.^2 - (2/omega)*x + (2/omega^2)*(1 - exp(-omega*x));
y2 = @(x) (omega * exp(x) + exp(-omega*x))/(omega + 1);

a = 0;
b = 1;

%%%%%%%%%%%%%%%%%%%%
% Case (i)
%%%%%%%%%%%%%%%%%%%%
f = @(x, y) -omega*(y - x^2);

y0= 0;
ErrorAB = [];
for N=[21, 41, 81, 161, 321, 641]
    h = (b - a)/(N-1);
    x = a:h:b;

    u = NumericalAnalysis.adamsBashforth4(f, a, b, y0, N);
    
    p = figure;
    plot(x, y1(x), 'r', x, u, 'bo');
    ErrorAB = [ErrorAB; norm(u' - y1(x), inf)];
    pause;
end
ErrorAB
ErrorAB(1:end-1)./ErrorAB(2:end)

ErrorPC = [];
for N=[21, 41, 81, 161, 321, 641]
    h = (b - a)/(N-1);
    x = a:h:b;

    u = NumericalAnalysis.adamsPredictorCorrector(f, a, b, y0, N);

    p = figure;
    plot(x, y1(x), 'r', x, u, 'bo');
    ErrorPC = [ErrorPC; norm(u' - y1(x), inf)];
    pause;
end
ErrorPC
ErrorPC(1:end-1)./ErrorPC(2:end)

%%%%%%%%%%%%%%%%%%%%
% Case (ii)
%%%%%%%%%%%%%%%%%%%%
f = @(x, y) -omega*(y - exp(x));
y0= 1;

ErrorAB = [];
for N=[21, 41, 81, 161, 321, 641]
    h = (b - a)/(N-1);
    x = a:h:b;

    u = NumericalAnalysis.adamsBashforth4(f, a, b, y0, N);

    p = figure;
    plot(x, y2(x), 'r', x, u, 'bo');
    ErrorAB = [ErrorAB; norm(u' - y2(x), inf)];
    pause
end
ErrorAB
ErrorAB(1:end-1)./ErrorAB(2:end)
ErrorPC = [];
for N=[21, 41, 81, 161, 321, 641]
    h = (b - a)/(N-1);
    x = a:h:b;
    u = NumericalAnalysis.adamsPredictorCorrector(f, a, b, y0, N);

    p = figure;
    plot(x, y2(x), 'r', x, u, 'bo');
    ErrorPC = [ErrorPC; norm(u' - y2(x), inf)];
    pause
end
ErrorPC
ErrorPC(1:end-1)./ErrorPC(2:end)