#!/bin/bash

INSTALLED_MODULE_NAME="Kubernetes";
KUBERNETES_VERSION="1.12.7"; # Please check here: https://github.com/kubernetes/kubernetes/releases

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';
sudo curl -LO 'https://storage.googleapis.com/kubernetes-release/release/v'$KUBERNETES_VERSION'/bin/linux/amd64/kubectl';
sudo chmod +x ./kubectl;
sudo mv ./kubectl /usr/local/bin/kubectl;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

echo '===Check '$INSTALLED_MODULE_NAME' version=============';
sudo kubectl version;
