#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd)"
source ${DIR}/env.sh

if [[ "$#" -eq 0 ]]; then
  echo "Usage: $0 <command> [ssh|passwd|sudo|generic] <options>"
  echo ""
  exit 1
fi

CMD=$1
shift 1

if [[ "$CMD" == "sudo" ]]; then
  echo -n "ansible_become_pass: "
  ansible-vault encrypt_string --vault-id ${PROJECT}@${VAULT_PASSWORD_FILE}
elif [[ "$CMD" == "passwd" ]]; then
  if [[ ! "$#" -eq 1 ]]; then
    echo "Usage: $0 <command> passwd <user>"
    echo ""
    exit 1
  fi

  echo -n "Password:" 1>&2
  read -s PASS
  echo -n $PASS | ansible-vault encrypt_string --vault-id ${PROJECT}@${VAULT_PASSWORD_FILE} --stdin-name "password_$1"
elif [[ "$CMD" == "generic" ]]; then
  if [[ ! "$#" -eq 1 ]]; then
    echo "Usage: $0 <command> generic <name>"
    echo ""
    exit 1
  fi

  echo -n "Value:" 1>&2
  read -s VALUE
  echo -n $VALUE | ansible-vault encrypt_string --vault-id ${PROJECT}@${VAULT_PASSWORD_FILE} --stdin-name "$1"
else
  if [[ ! "$#" -eq 1 ]]; then
    echo "Usage: $0 <command> ssh <user>"
    echo ""
    exit 1
  fi

  echo "ansible_ssh_user: $1"
  echo -n "ansible_ssh_pass: "

  shift 1
  ansible-vault encrypt_string --vault-id ${PROJECT}@${VAULT_PASSWORD_FILE} "$@"
fi


