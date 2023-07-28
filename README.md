# Handy scripts :frog:
> __a few useful scripts and code snippets for managing secrets and certs__

- `./get-secret.sh <secret-id>` 
  - takes a secret id 
  - gets the secret from secrets manager
  - outputs the secret value to a file and the console

- `./compare-secret.sh <secret-id>` 
  - takes a secret id 
  - gets the current and previous version of a secret

- `./list-secrets.sh <keyword>`
  - takes a keyword 
  - finds all the secrets with the keyword in the name
  - prints the secret value

- `./check-expiry-domain.sh <domain>`
  - takes a domain
  - reads the certificate
  - prints the expiry date

- `./check-expiry-file.sh <filename>`
  - takes a file name
  - reads the certificate
  - prints the expiry date