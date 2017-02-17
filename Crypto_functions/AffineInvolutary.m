function [ output ] = AffineInvolutary( Z )
% Find involutary keys in affine cipher

x = 1;

for i = 1:Z
    for j = 0:Z
        inverse = FindModInverse(i,Z);
        if (inverse ~= -1)
            if((i == mod(inverse, Z)) && (j == mod(-1*inverse*j, Z)))
                output(x,1) = i;
                output(x,2) = j;
                x = x + 1;
            end
        end
    end
end


end

