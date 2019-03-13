#!/bin/bash

echo '===Start installing Node.js, NPM, and Yarn=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y curl;

echo '===Add official GPG key for Node.js=============';
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo '===Install Node.js=============';
sudo apt-get install -y nodejs;

echo '===Finish instaling Node.js=============';

echo '===Add official GPG key for Yarn=============';
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;

echo '===Add Yarn'\''s official repository =============';
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install Yarn=============';
sudo apt-get install -y yarn;

echo '===Check Node.js version=============';
sudo node -v;

echo '===Check NPM version=============';
sudo npm -v;

echo '===Check Yarn version=============';
yarn --version;
