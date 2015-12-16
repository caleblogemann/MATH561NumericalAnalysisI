clear all
format long

f = @(x) sin(x); 

a = 0; b = pi; 

for n = [1 2 4 8 16]
    R = romberg(f,a,b,n);
    
    tril(R)
    
    tril(R- tril(ones(n,n)*2))
    
    pause
end