#!/bin/bash

INSTALLED_MODULE_NAME="Ansible";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Add '$INSTALLED_MODULE_NAME$'\'s official repository =============';
sudo add-apt-repository ppa:ansible/ansible -y;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y ansible;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
ansible --version
