#!/bin/bash

INSTALLED_MODULE_NAME=".NET Core";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Set up the variables for later usage=============';
DOT_NET_PACKAGE_NAME="packages-microsoft-prod.deb";
DOT_NET_PACKAGE_DOWNLOAD_URL="https://packages.microsoft.com/config/ubuntu/16.04/$DOT_NET_PACKAGE_NAME";

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget apt-transport-https;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s package installer=============';
sudo wget -nc $DOT_NET_PACKAGE_DOWNLOAD_URL;

echo '===Install '$INSTALLED_MODULE_NAME' package using dpkg=============';
sudo dpkg -i $DOT_NET_PACKAGE_NAME;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y dotnet-sdk-2.1;

echo '===Remove unneeded artifacts=============';
sudo rm $DOT_NET_PACKAGE_NAME;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
dotnet --version;
