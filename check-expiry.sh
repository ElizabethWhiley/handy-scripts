#!/usr/bin/env bash

# A few snippets for managing certs using openssl
# Takes file with the filename cert.pem and checks the expirty
# Takes a Domain and Port and checks the expiry
# Comment out lines as necessary

fail() { echo "🔥  $*" >&2; exit 1; }

# checks
for x in openssl; do
	hash "$x" 2>/dev/null || fail "missing dep $x"
done

# If the cert file exists, check the expiry
FILE=cert.pem
if test -f "$FILE"; then
	openssl x509 -in cert.pem -text | openssl x509 -noout -enddate
else 
	echo "no cert file"	
fi

# Checks an expiry given the domain
DOM=$1
if test -z $DOM; then
	echo "No domain"
else 
	echo -n Q | openssl s_client -servername $DOM -connect $DOM:443 \
	| openssl x509 -noout -dates
fi	