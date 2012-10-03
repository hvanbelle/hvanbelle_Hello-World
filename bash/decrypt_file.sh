#!/bin/sh

# decrypt base64-encoded version

openssl enc -d -aes-256-cbc -a -in file.enc -out file.txt
