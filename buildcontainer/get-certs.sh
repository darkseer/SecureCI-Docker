#!/bin/bash

#This gets all the needed certs into the java keysstore automatically

openssl s_client -connect $1 -showcerts </dev/null |  sed -n '/^-----BEGIN CERT/,/^-----END CERT/p' | awk 'split_after==1{n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1} {print > "cert" n ".pem"}'
ls *.pem | xargs -L1 -I'{}' keytool 