#!/usr/bin/env bash

# A few snippets for getting a secret from AWS Secrets Manager
# Pass in the secret id eg. ./get-secret.sh my-secret
# Comment out lines as necessary

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

# Output the secret value to a file
# Here it outputs to secret.txt - change the filename as required
aws secretsmanager get-secret-value --secret-id $ID \
    --query 'SecretString' --output text > secret.txt


