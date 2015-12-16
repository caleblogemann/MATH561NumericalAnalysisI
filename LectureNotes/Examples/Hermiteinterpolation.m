function Q = Hermiteinterpolation(x,f,df)

x = x(:); f = f(:); df = df(:);

n = length(x);
Q = zeros(2*n,2*n);

z = zeros(2*n,1);
z(1:2:end-1) = x;
z(2:2:end) = x;

Q(1:2:end-1,1) = f;
Q(2:2:end,1) = f;
Q(2:2:end,2) = df;

Q(3:2:end-1,2) = (Q(3:2:end-1,1) - Q(2:2:end-2,1))./(z(3:2:end-1)-z(2:2:end-2));


for i = 2:2*n-1
    for j = 2:i
        Q(i+1,j+1) = (Q(i+1,j)-Q(i,j))/(z(i+1)-z(i-j+1));
    end
end