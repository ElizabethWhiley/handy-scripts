#!/usr/bin/env sh

# This script removes secrets with the 7 day recovery delay
export AWS_PAGER=""
# Fail func
    fail() { echo "🔥  $*" >&2; exit 1; }

# Check deps
hash aws 2>/dev/null || fail "missing aws cli"
aws sts get-caller-identity &>/dev/null || fail "think you need to auth!"

# Check if there are no arguments
if [ "$#" -eq 0 ]; then
    fail "Please provide the names of the secrets to delete, separated by a space"
fi

# Create an array from the command-line arguments
secrets=("$@")

read -r -p "Are you sure you want to delete the secrets? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # include the force-delete option if you want instant deletion - be careful!
    for secret in ${secrets[@]}; do 
        aws secretsmanager delete-secret --secret-id $secret #--force-delete-without-recovery
    done  
else
    fail "no worries!"
fi  