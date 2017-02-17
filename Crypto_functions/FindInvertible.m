function [ inv n ] = FindInvertible( Z )
% Find invertible integers in series of z elements
% gcd(m,n) = 1
% x = linspace(1,Z,Z);
% n is number of invertibles
x = 1;

for i = 1:Z
    if(FindModInverse(i,Z) ~= -1)
        inv(x,1) = i;
        inv(x,2) = FindModInverse(i,Z);
        x = x + 1;
    end
end
n = size(inv,1);

end

