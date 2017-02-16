function y = DecryptVigenereJPG(x, k)
%Decrypt Vigenere encrypted jpeg data

k1 = double(k);
n = size(x, 2);
m = size(k, 2);
for i = 1 : n
    y(i) = mod(x(i) - k1(mod(i-1, m) + 1), 256);
end;
