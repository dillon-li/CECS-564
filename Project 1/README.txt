Project for my cryptography class to encrypt/decrypt a .jpg image using Vigenere cipher.

Encrypts in bytestream (binary) data, not pixel image data. (fread from open file stream)

IOC and check peak periodicity to determine key length. 

VigenereJPG function will do encryption/decryption and spit out image for you.
Inputs: filename, keyword
Outputs: encrypted bytestream, decrypted bytestream, pixel_img data

AttackVigenere function will take in encrypted bytestream and keyword length and attempt to crack the keyword using various curve fitting techniques. Will output each character 3 times based on different guesses.

Have fun encrypting and decrypting .jpg images between you and your friends!

Dillon Li