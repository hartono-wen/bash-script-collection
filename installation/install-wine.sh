#!/bin/bash

INSTALLED_MODULE_NAME="Wine";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget;

echo '===Download the key to authenticate '$INSTALLED_MODULE_NAME$'\' package=============';
sudo wget -nc https://dl.winehq.org/wine-builds/Release.key;

echo '===Add the key to authenticate '$INSTALLED_MODULE_NAME$'\' package=============';
sudo apt-key add Release.key;

echo '===Add '$INSTALLED_MODULE_NAME$'\'s repository=============';
sudo apt-add-repository -y https://dl.winehq.org/wine-builds/ubuntu/;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y --allow-unauthenticated --install-recommends winehq-stable;

echo '===Remove unneeded artifacts=============';
sudo rm Release.key;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
wine --version;
