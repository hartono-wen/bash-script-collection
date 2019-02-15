#!/bin/bash

INSTALLED_MODULE_NAME=".NET Core";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget apt-transport-https;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s package installer=============';
sudo wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb;

echo '===Install '$INSTALLED_MODULE_NAME' package using dpkg=============';
sudo dpkg -i packages-microsoft-prod.deb;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y dotnet-sdk-2.1;

echo '===Remove unneeded artifacts=============';
sudo rm packages-microsoft-prod.deb;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
dotnet --version
