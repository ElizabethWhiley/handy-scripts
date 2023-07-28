# Handy scripts :frog:
> __scripts and code snippets__

##
- `./get-secret.sh <secret-id>` 
  - takes a secret id 
  - gets the secret from AWS Secrets Manager
  - outputs the secret value to a file and the console
  - eg. `./get-secret.sh my-secret`

##
- `./compare-secret.sh <secret-id>` 
  - takes an AWS Secrets Manager secret id 
  - gets the current and previous version of a secret
  - eg. `./get-secret.sh my-secret`

##
- `./list-secrets.sh <keyword>`
  - takes a keyword 
  - finds all the AWS secrets with the keyword in the name
  - prints the secret value
  - eg. `./list-secrets.sh test` 

##
- `./delete-secrets.sh <secret-names>`
  - takes a list of AWS secret names, separated by a space
  - deletes them
  - includes an option to remove the 7-day recovery
  - `./delete-secrets.sh secret-1 secret-2 secret-3`

## 
- `./check-expiry-domain.sh <domain>`
  - takes a domain
  - reads the certificate
  - prints the expiry date
  - eg. `./check-expiry-domain.sh google.com`

##
- `./check-expiry-file.sh <filename>`
  - takes a file name
  - reads the certificate
  - prints the expiry date
  - `./check-expiry-file.sh cert.pem`