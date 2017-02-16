function [ encrypted, decrypted, pixel_img ] = VigenereJPG( filename, keyword  )
% Wrapper for the JPEG Vigenere encryption/decryption
% Takes in the filename of the JPEG image and a keyword, returns the encrypted and decrypted bytestreams and displays the image
% N.B. decrypted will be the same as the original bytestream data

f = fopen(filename, 'r');
data = fread(f); % bytestream data of image
data = data'; % Encrypt/Decrypt currently process horizontal matrices

encrypted = EncryptVigenereJPG(data, keyword);
decrypted = DecryptVigenereJPG(encrypted, keyword);

pixel_img = ShowJPG(decrypted);

end

