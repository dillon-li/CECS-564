function [ output_bitstream, output_plaintext, orig_bitstream ] = EncryptCSS( bitstream, key )

% Bitstream is the 40 bit stream to be encrypted
% key is the 40 bit key

bytes = dec2bin(bitstream,8); % 5x8 character array with each byte; bytes(1,:) is the 1st byte
if (size(bytes) ~= [5 8])
    display('Your data is not 5 bytes (40 bits) long');
    return;
end

bitstream = [bytes(1,:) bytes(2,:) bytes(3,:) bytes(4,:) bytes(5,:)];
% Generate psuedo-random bitstream
bitmask = CSSBitstream(key);
output_bitstream = blanks(40);
% XOR with plaintext bits
for k = 1:40
    output_bitstream(k) = num2str(xor(str2num(bitstream(k)), str2num(bitmask(k))));
end

output_plaintext = [char(bin2dec(output_bitstream(1:8))) char(bin2dec(output_bitstream(9:16))) char(bin2dec(output_bitstream(17:24))) char(bin2dec(output_bitstream(25:32))) char(bin2dec(output_bitstream(33:40)))];
orig_bitstream = bitstream;

end

