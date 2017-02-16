%This procedure attacks shift cipher crypto system by comparing the
%histogram of the plaintext with the shifted histogram of the
%ciphertext. It performs three curve fitting techniques.
%Sum-Absolute-Difference, looking for the shift that gives a minimum.
%dot product; looking for maximum.
%Sum-squares of differences; looking for minimum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Has been modified to fit my needs for attacking jpeg encrypted data
%
function AttackShiftJPG(x, y)
pdf = Generatepdf(size(y,2));
% file = fopen('nia_yoko.jpg', 'r');
% bytes = fread(file);
% [pdf, edges] = histcounts(bytes, 256, 'Normalization', 'probability');
h1=hist(double(x), 1:256) / size(x,2);
temp0 = 999999;
temp1 = 0;
temp2 = 999999;
for i = 1 : 256
    h0s = circshift(pdf', i - 1);
    a = abs(h0s' - h1);
    b = h0s' .* h1;
    sad = sum(a);
    if sad < temp0
        c(1) = i;
        temp0 = sad;
    end;
    dp = sum(b);
    if dp > temp1
        c(2) = i;
        temp1 = dp;
    end;
    chi = sum(a .* a);
    if chi < temp2
        c(3) = i;
        temp2 = chi;
    end;
end;
fprintf('Minimum sum-absolute-difference; sad, of the two histograms\n');
fprintf('corresponds to shift key equals\n');
display(char(c(1)));
fprintf('\n\nMaximum dot product ; d, of the two histograms\n');
fprintf('corresponds to shift key equals\n');
display(char(c(2)));
fprintf('\n\nMinimum sum-squares of differences; ss, of the two histograms\n');
fprintf('corresponds to shift key equals\n');
display(char(c(3)));
fprintf('\n\n');