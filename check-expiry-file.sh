#!/usr/bin/env sh

# Takes a file name, reads the cert and checks the expiry
fail() { echo "🔥  $*" >&2; exit 1; }

# checks
hash openssl 2>/dev/null || fail "missing openssl"

# If the cert file exists, check the expiry
FILE=$1
if test -f "$FILE"; then
	openssl x509 -in $FILE -text | openssl x509 -noout -enddate
else 
	fail "Please provide a valid certificate file name"	
fi