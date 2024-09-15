# 128 bit AES encryption in VHDL

This project implements the 128 bit AES encryption standard as defined [here](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197-upd1.pdf) in VHDL. The individual files implement the steps of the cipher: SubBytes, ShiftRows, MixColumns and AddRoundKey, and the 
keyexp.vhd file producing the expanded version of the 128 bit key. The steps of the cipher were intially implemented in separate files and tested, but we then defined them as functions in the Controller file for convenience. We have not implemented the inverse cipher currently,
but verified correctness by comparing inputs with their encrypted version as described in the paper.
