#!/bin/sh

# encrypt file.txt to file.enc using 256-bit AES in CBC mode 
# output is base64 encoded for, e.g., e-mail

openssl enc -aes-256-cbc -a -salt -in file.txt -out file.enc
