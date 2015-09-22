% Problem #4
for i=0:5
    n = 10^i;
    %n = ceil(n/2);
    lambda = calculateLebesgueConstant(n);
    lambdaSingle = calculateLebesgueConstant(n, 'UseSinglePrecision', true);
    d = abs(lambda - lambdaSingle);
    fprintf('%10.0f %12.8f %19.16f %12.4e\n', n, lambdaSingle, lambda, d);
end

% Problem #6
figure
hold on
x = 0:.01:2;
y = ones(1,length(x));
y(x > 1) = 0;
plot(x, y);

disp('       n     cond(A)      solution');
for n=1:8
    A = 1./(repmat((1:n), n, 1) + repmat((1:n)', 1, n));
    i = (1:n)';
    b = 1./i .* (1 - exp(-i));
    c = inv(A) * b;
    con = cond(A);
    fprintf('%8.0f %12.4e\n', n, con);
    fprintf('%45.14e\n', c);
    if(i <= 4)
        y = c' * exp(-i*x);
        plot(x, y);
    end
end
hold off
