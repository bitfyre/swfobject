#!/usr/bin/env bash

openssl genrsa -des3 -out ../certs/self-signed.pass.key 2048
openssl rsa -in ../certs/self-signed.pass.key -out ../certs/self-signed.key
openssl req -new -key ../certs/self-signed.key -out ../certs/self-signed.csr
openssl x509 -req -days 365 -in ../certs/self-signed.csr -signkey \
  ../certs/self-signed.key -out ../certs/self-signed.crt

echo "SHA1 fingerprint:\n"
openssl x509 -in ../certs/self-signed.crt -sha1 -noout -fingerprint

rm ../certs/self-signed.pass.key
rm ../certs/self-signed.csr
