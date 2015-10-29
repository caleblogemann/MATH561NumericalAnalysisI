% create function to be integrated
f = @(x) exp(x)/x;

% set bounds
a = 1;
b = 2;
n = 10;

% find romberg array for function f
T = NumericalAnalysis.rombergIntegration(a, b, n, f);

% print results
fprintf('     i         T(i,1)            T(i,i) \n');
for i=1:n
    fprintf('%6.0f %19.15f %19.15f \n', i, T(i,1), T(i,i));
end
