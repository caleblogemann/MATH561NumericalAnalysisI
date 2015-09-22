
figure
hold on
x = 0:.01:2;
y = ones(x);
y(x > 1) = 0;
plot(x, y);

for n=1:8
    A = 1./(repmat((1:n), n, 1) + repmat((1:n)', 1, n));
    i = (1:n)';
    b = 1./i .* (1 - exp(-i));
    c = inv(A) * b;
    con = cond(A);
    if(i <= 4)
        y = c' * exp(i*x);
        plot(x, y);
    end
end
hold off
