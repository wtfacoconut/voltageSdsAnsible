#!/bin/bash

# TODO:
#   - Add logic to detect Linux OS flavor
#   - Then run bootstrap steps for detected Linux flavor 

sudo apt remove -y unattended-upgrades
sudo apt update
sudo apt install --yes software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install --yes ansible ansible-lint