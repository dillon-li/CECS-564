function AttackVigenereJPG(y,length)
n=length*floor(size(y,2)/length);
y=y(1:n);
w=reshape(y',length,n / length);
for i = 1 : length
    AttackShiftJPG(w(i,:), y)
end;
