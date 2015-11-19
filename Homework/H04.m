yInit = [1; 1; 1];

% create objects to solve ODES with specific method
euler = NumericalAnalysis.ODES.eulerMethod;
rk4 = NumericalAnalysis.ODES.standardRK4Method;

% non stiff problem
lambda1 = 1;
lambda2 = 0;
lambda3 = 1;

A = 1/2*[lambda2 + lambda3, lambda3 - lambda1, lambda2 - lambda1;
lambda3 - lambda2, lambda1 + lambda3, lambda1 - lambda2;
lambda2 - lambda3, lambda1 - lambda3, lambda1 + lambda2];

f = @(x,y) A*y;

% store actual solution as function
y = @(x) [-exp(lambda1*x) + exp(lambda2*x) + exp(lambda3*x);
exp(lambda1*x) - exp(lambda2*x) + exp(lambda3*x);
exp(lambda1*x) + exp(lambda2*x) - exp(lambda3*x)];

eulerError = [];
rkError = [];

for N=[5,10,20,40,80]
    x = linspace(0,1,N);

    % compute actual solution
    yActual = y(x);

    u = euler.solveSystem(f, x, yInit);
    eulerError = [eulerError; norm(yActual - u)];

    u = rk4.solveSystem(f, x, yInit);
    rkError = [rkError; norm(yActual-u)];
end

% display error
format long
eulerError
rkError

% stiff problem
lambda1 = 0;
lambda2 = -1;
lambda3 = -100;

A = 1/2*[lambda2 + lambda3, lambda3 - lambda1, lambda2 - lambda1;
lambda3 - lambda2, lambda1 + lambda3, lambda1 - lambda2;
lambda2 - lambda3, lambda1 - lambda3, lambda1 + lambda2];

f = @(x,y) A*y;

% store actual solution as function
y = @(x) [-exp(lambda1*x) + exp(lambda2*x) + exp(lambda3*x);
exp(lambda1*x) - exp(lambda2*x) + exp(lambda3*x);
exp(lambda1*x) + exp(lambda2*x) - exp(lambda3*x)];

eulerError = [];
rkError = [];

for N=[5,10,20,40,80]
    x = linspace(0,1,N);

    % compute actual solution
    yActual = y(x);

    u = euler.solveSystem(f, x, yInit);
    eulerError = [eulerError; norm(yActual - u)];

    u = rk4.solveSystem(f, x, yInit);
    rkError = [rkError; norm(yActual-u)];
end

% display error
format long
eulerError
rkError
