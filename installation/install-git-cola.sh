#!/bin/bash

INSTALLED_MODULE_NAME="Git Cola";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';
echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y git-cola;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
git-cola --version
