#!/usr/bin/env bash

# update and upgrade all packages
sudo -H apt update && sudo -H apt upgrade -y

# install ansible
sudo -H apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
  && sudo -H pip3 install wheel \
  && sudo -H pip3 install ansible

