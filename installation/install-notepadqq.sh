#!/bin/bash

INSTALLED_MODULE_NAME="Notepadqq ";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Add '$INSTALLED_MODULE_NAME$'\'s official repository =============';
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y notepadqq;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
notepadqq -v
