function c = EncryptVigenereJPG(x, k)
% Encrypt jpeg data in Vigenere cipher
if (size(x,1) ~= 1)
    x = x';
end

k1 = double(k);
n = size(x, 2);
m = size(k, 2);
for i = 1 : n 
    c(i) = mod(x(i) + k1(mod(i-1, m)+1), 256);
end;