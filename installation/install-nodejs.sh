#!/bin/bash

echo '===Start installing Node.js=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y curl;

echo '===Add official GPG key for Node.js=============';
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo '===Install Node.js=============';
sudo apt-get install -y nodejs

echo '===Finish instaling Node.js=============';

echo '===Check Node.js version=============';
sudo node -v;

echo '===Check NPM version=============';
sudo npm -v;
