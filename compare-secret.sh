#!/usr/bin/env sh

# Gets the current and previous version of a secret for comparison 
# Pass in the secret id eg. ./compare-secret.sh my-secret

export AWS_PAGER=""

# Secret id
ID=$1

# func
fail() { echo "🔥  $*" >&2; exit 1; }

# checks
for x in aws jq; do
	hash "$x" 2>/dev/null || fail "missing dep $x"
done

aws sts get-caller-identity &>/dev/null || fail "think you need to auth!"

# Get a secret based on a secret id

aws secretsmanager get-secret-value --secret-id $ID

# Get the previous version of the secret

aws secretsmanager get-secret-value --secret-id $ID \
    --version-stage AWSPREVIOUS

