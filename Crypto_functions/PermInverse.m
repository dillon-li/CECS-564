function [ inv ] = PermInverse( cycles, mode )
% Inverse of a permutation
% set mode = 1 for numbers
% set mode = 2 for letters

inv(1,:) = cycles(1,:);

if (mode == 1)
    for i = 1:size(cycles,2)
        [a,loc] = ismember(i, cycles(2,:));
        inv(2,i) = cycles(1,loc);
    end
elseif (mode == 2)
    for i = 1:size(cycles,2)
        [a,loc] = ismember(upper(inv(1,i)), cycles(2,:));
        inv(2,i) = upper(cycles(1,loc));
    end
else 
    display('Improper parameter chosen for mode');
end

        