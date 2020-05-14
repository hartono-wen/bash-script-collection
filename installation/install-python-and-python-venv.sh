#!/bin/bash

INSTALLED_MODULE_NAME="Python 3.8 and venv";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';
echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install software-properties-common=============';
sudo apt-get install -y software-properties-common;

echo '===Add deadsnakes/ppa repository for Python installation purpose=============';
sudo add-apt-repository ppa:deadsnakes/ppa -y;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y python3.8 python3.8-venv; 

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
python3.8 -V;
