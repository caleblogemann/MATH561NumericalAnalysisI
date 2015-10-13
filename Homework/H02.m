% # 8
n = 11;
N = 51;
i = 1:n;

% part (1)
disp('part (1)');
x = (i-1)/(n-1);
f = exp(-x);
[c0, c1, c2, c3] = NumericalAnalysis.cubicSpline(x, f);
disp('e^(-x)');
printErrmax(c0, c1, c2, c3, x, @(x) exp(-x), N);

f = x.^(5/2);
[c0, c1, c2, c3] = NumericalAnalysis.cubicSpline(x, f);
[c0, c1, c2, c3] = NumericalAnalysis.cubicSpline(x, f);
disp('x^(5/2)');
printErrmax(c0, c1, c2, c3, x, @(x) x.^(5/2), N);

% part (2)
disp('part (2)');
x = x.^2;
f = x.^(5/2);
[c0, c1, c2, c3] = NumericalAnalysis.cubicSpline(x, f);
disp('x^(5/2)');
printErrmax(c0, c1, c2, c3, x, @(x) x.^(5/2), N);
