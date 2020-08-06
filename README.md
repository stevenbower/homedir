# Homedir

Setup and manage my home directory / development environment (mostly targetted at WSL)

# Usage

```$ ./setup.sh```

# Create vault password

```$ openssl rand -base64 32 > .vault-password```

# Create an encrtyped host_var containing your sudo password

```$ ansible-vault encrypt_string --vault-id sudo@.vault-password --stdin-name ansible_become_password > host_vars/localhost.yml```
