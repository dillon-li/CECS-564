function y = IOC(x)
n = size(x, 2);
for i = 1 : 60
    t = 0;
    n1 = n - i;
    for j = 1 : n1
        if x(j) == x(j + i)
            t = t + 1;
        end;
    end;
    y(i) = t / n1; 
end;