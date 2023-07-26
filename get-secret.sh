#!/usr/bin/env bash

# A few snippets for getting a secret from AWS Secrets Manager
# Comment out lines as necessary
# Pass in the secret id eg. ./get-secret.sh my-secret

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

# Get a secret based on a secret id held in ID var
aws secretsmanager get-secret-value --secret-id $ID

# Compare it with a previous version
aws secretsmanager get-secret-value --secret-id $ID \
    --version-stage AWSPREVIOUS

# Output the secret value to a file
aws secretsmanager get-secret-value --secret-id $ID \
    --query 'SecretString' --output text > secret.txt


