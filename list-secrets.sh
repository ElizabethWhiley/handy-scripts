#!/usr/bin/env sh

# Pass in a keyword to find and filter for secrets with that word in the name or description
# eg. ./list-secrets.sh beagle will return a secret with the name beagle or dog/beagle

export AWS_PAGER=""
KEYWORD=$1

# func
fail() { echo "🔥  $*" >&2; exit 1; }

# checks
for x in aws jq; do
	hash "$x" 2>/dev/null || fail "missing dep $x"
done

aws sts get-caller-identity &>/dev/null || fail "think you need to auth!"

# Finds the arns of secrets with the keyword in the name or description
arns=$(aws secretsmanager list-secrets \
    --filter Key="all",Values=$KEYWORD \
    | jq -r '.SecretList[].ARN')

# Prints the secret text for each secret
for arn in ${arns[@]}; do
    aws secretsmanager get-secret-value --secret-id $arn --output text   
done  