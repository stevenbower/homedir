#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd)"

source ${DIR}/env.sh

# install python
if [[ "$(dpkg-query -l | grep 'python3-\(pip\|setuptools\)' | wc -l)" != "2" ]]; then
  echo "---- Setting up python"
  sudo -H apt-get install -y --no-install-recommends \
      sshpass \
      python3 \
      python3-pip \
      python3-setuptools
else
  echo "---- Python setup complete, skipping..."
fi

# install sshpass
if [[ "$(dpkg-query -l | grep 'sshpass' | wc -l)" != "1" ]]; then
  echo "---- Setting up sshpass"
  sudo -H apt-get install -y --no-install-recommends \
      sshpass
else
  echo "---- Sshpass setup complete, skipping..."
fi

# install wheel
if [[ "$(pip3 list --format=columns | grep wheel | wc -l)" != "1" ]]; then
  echo "---- Installing Wheel"
  sudo -H pip3 install wheel
else
  echo "---- Wheel setup complete, skipping..."
fi

# install ansible
if [[ "$(pip3 list --format=columns | grep "ansible\s" | wc -l)" != "1" ]]; then
  echo "---- Installing ansbile"
  sudo -H pip3 install ansible
else
  echo "---- Ansible setup complete, skipping..."
fi

if [[ ! -f ${VAULT_PASSWORD_FILE} ]]; then
    echo "---- Generating vault password"
    openssl rand -base64 64 > ${VAULT_PASSWORD_FILE}
else
  echo "---- Vault password file exists, skipping..."
fi
