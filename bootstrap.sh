#!/bin/bash

sudo apt remove -y unattended-upgrades
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible ansible-lint

curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz
tar -xf vscode_cli.tar.gz
sudo mv code /usr/bin/.
rm vscode_cli.tar.gz