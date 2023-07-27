#!/usr/bin/env sh

# Takes a domain and checks the expiry
# eg. ./check-expiry-domain.sh google.com

fail() { echo "🔥  $*" >&2; exit 1; }

# checks
for x in openssl; do
	hash "$x" 2>/dev/null || fail "missing dep $x"
done

# Checks an expiry given the domain
DOM=$1
if test -z $DOM; then
	echo "No domain"
else 
	echo -n Q | openssl s_client -servername $DOM -connect $DOM:443 \
	| openssl x509 -noout -dates
fi	