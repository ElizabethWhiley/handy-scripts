#!/usr/bin/env bash

# A few snippets for listing multiple secrets in Secrets Manager
# Comment out lines as necessary

export AWS_PAGER=""
KEYWORD=$1

# func
fail() { echo "🔥  $*" >&2; exit 1; }

# checks
for x in aws jq; do
	hash "$x" 2>/dev/null || fail "missing dep $x"
done

aws sts get-caller-identity &>/dev/null || fail "think you need to auth!"

# Pass in a keyword to filter for secrets with that word in the name
# Collects a list of ARNs
arns=$(aws secretsmanager list-secrets \
    --filter Key="all",Values=$KEYWORD \
    | jq -r '.SecretList[].ARN')

# Prints the secret text for each secret
for arn in ${arns[@]}; do
    echo $arn
    aws secretsmanager get-secret-value --secret-id $arn --query SecretString --output text   
done  