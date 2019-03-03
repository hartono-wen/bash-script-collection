#!/bin/bash

INSTALLED_MODULE_NAME="xdotool ";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y xdotool;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
xdotool -v;
