#!/bin/bash

sudo apt-get install -y curl apt-transport-https;

sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg;
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/;
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list';

sudo apt-get update;
sudo apt-get install -y code;

sudo rm microsoft.gpg
