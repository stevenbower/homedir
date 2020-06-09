#!/usr/bin/env bash

ansible-playbook ${ANSIBLE_EXTRA} --vault-id sudo@.vault-password -i inventory/hosts.yml site.yml
