function [ bytestream ] = CSSBitstream( passcode )
% Passcode is a 40-bit word (5 bytes)
% Will perform LFSR shifting using a 17-bit (R1) and 25-bit (R2) registers
% with the fourth bit initialized to 1.
% Those bits will be added using a full adder to create encrypted text

bytes = dec2bin(passcode,8); % 5x8 character array with each byte; bytes(1,:) is the 1st byte
if (size(bytes) ~= [5 8])
    display('Your key is not 5 bytes (40 bits) long');
    return;
end

R1 = [bytes(1,:) bytes(2,1:5) '1' bytes(2,6:8)];
R2 = [bytes(3,:) bytes(4,:) bytes(5,1:5) '1' bytes(5,6:8) ];

x = blanks(8); % byte from R1
y = blanks(8); % byte from R2
bytestream = blanks(40);
c_in = 0;

% Get output bytes x (1st 2 bytes)
for k = 1:5
    for j = 1:8
        % Register 1 poly: x^17 + x^3 + 1
        % indices are adjusted bc here, 1 is most significant bit
        x(j) = R1(1);
        R1 = circshift(R1,1);
        R1(1) = num2str(xor(str2num(R1(1)), str2num(R1(15))));
        % display(R1);
        
        % x^25 + x^8 + x^6 + x^2
        y(j) = R2(1);
        R2 = circshift(R2,1);
        term1 = xor(str2num(R2(1)), str2num(R2(18)));
        term2 = xor(str2num(R2(20)), str2num(R2(24)));
        R2(1) = num2str(xor(term1, term2));
        % display(R2);
        
        % Full Adder
        byte_index = 41 - ((k-1)*8+j);
        sum = str2num(x(j)) + str2num(y(j)) + c_in;
        if (sum == 2)
            bytestream(byte_index) = '0';
            c_in = 1;
        elseif (sum == 3)
            bytestream(byte_index) = '1';
            c_in = 1;
        else
            bytestream(byte_index) = num2str(sum);
            c_in = 0;
        end
    end

end

% display(bytestream);

end

