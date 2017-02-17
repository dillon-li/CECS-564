function [ output ] = FindModInverse( n, m )
% Find modular inverse of a number
% n is the number
% m is the mod

% z = ExtendedEuclidean(n, m);
% g = z(1);
% s = z(2);
% r = z(3);
% if (g ~= 1)
%   output = -1;
% end

% if ((n*r + m*s) == 1)
%     output = r;
% elseif ((n*s + m*r) == 1)
%     output = s;
% end
if (gcd(n,m) ~= 1)
    output = -1;
else
    [d, a, b] = gcd(n,m);
    output = mod(a,m);
end
end

