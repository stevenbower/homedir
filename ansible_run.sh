#!/usr/bin/env bash

ansible-playbook ${ANSIBLE_EXTRA} --vault-id sudo@.vault_password -i inventory/hosts.yml site.yml
