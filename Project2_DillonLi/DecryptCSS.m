function [ orig_stream, orig_text ] = DecryptCSS( bitstream, key )

% Bitstream is the 40 bit stream to be decrypted
% key is the 40 bit key

if (size(bitstream,2) ~= 40)
    display('The size of your data is incorrect (not 40 bits)');
end

% Generate psuedo-random bitstream
bitmask = CSSBitstream(key);
orig_stream = blanks(40);
% XOR with plaintext bits
for k = 1:40
    orig_stream(k) = num2str(xor(str2num(bitstream(k)), str2num(bitmask(k))));
end

orig_text = [char(bin2dec(orig_stream(1:8))) char(bin2dec(orig_stream(9:16))) char(bin2dec(orig_stream(17:24))) char(bin2dec(orig_stream(25:32))) char(bin2dec(orig_stream(33:40)))];

end


