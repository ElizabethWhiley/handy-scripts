# Handy scripts
> __a few useful scripts and code snippets for managing secrets and certs__



- `./get-secret.sh <secret-id>` 
  
  Takes a secret id and 
  - gets the secret from secrets manager
  - prints the current and previous version of the secret
  - outputs the secret value to a file

- `./list-secrets.sh <keyword>`
  
  Takes a keyword and 
  - lists all the secrets with the keyword in the name
  - collects all the ARNs
  - prints the value of each secret from the filtered list  

- `./check-expiry.sh <domain>`

  - If a `cert.pem` file is present, it prints the cert expiry date
  - If given a domain, it prints the cert expiry date for the domain