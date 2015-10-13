function [] = printErrmax(c0, c1, c2, c3, x, fun, N)
    deltaX = diff(x);
    j = 1:N;
    for i=1:(length(x)-1)
        xij = x(i) + (j-1)/(N-1)*deltaX(i);
        f = fun(xij);
        t = xij - x(i);
        s = c0(i) + c1(i)*t + c2(i)*t.^2 + c3(i)*t.^3;
        errs = abs(s - f);
        errmax = max(errs);
        fprintf('%8.0f %12.4e\n', i, errmax);
    end
end
