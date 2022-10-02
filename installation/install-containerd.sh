#!/bin/bash

set -e;
set -x;

INSTALLED_MODULE_NAME="containerd";
echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

CONTAINERD_VERSION="1.6.8";
CONTAINERD_PACKAGE="containerd-$CONTAINERD_VERSION-linux-amd64.tar.gz";
CONTAINERD_SYSTEMD_SERVICE_FILE_LOCATION="/usr/local/lib/systemd/system";

curl -LO "https://github.com/containerd/containerd/releases/download/v$CONTAINERD_VERSION/$CONTAINERD_PACKAGE";

sudo tar Czxvf /usr/local $CONTAINERD_PACKAGE;

sudo mkdir --parent $CONTAINERD_SYSTEMD_SERVICE_FILE_LOCATION;

sudo curl -Lo $CONTAINERD_SYSTEMD_SERVICE_FILE_LOCATION/containerd.service https://raw.githubusercontent.com/containerd/containerd/main/containerd.service;

sudo systemctl daemon-reload;
sudo systemctl enable --now containerd;
sudo systemctl status containerd;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

INSTALLED_MODULE_NAME="runc";
echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

RUNC_PACKAGE="runc.amd64";
sudo curl -LO "https://github.com/opencontainers/runc/releases/download/v1.1.4/$RUNC_PACKAGE";
sudo install -m 755 $RUNC_PACKAGE /usr/local/sbin/runc;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

INSTALLED_MODULE_NAME="CNI Plugins";
echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

CNI_PLUGINS_VERSION="1.1.1";
CNI_PLUGINS_PACKAGE="cni-plugins-linux-amd64-v$CNI_PLUGINS_VERSION.tgz";
CNI_INSTALLATION_DIRECTORY="/opt/cni/bin";

curl -LO "https://github.com/containernetworking/plugins/releases/download/v$CNI_PLUGINS_VERSION/$CNI_PLUGINS_PACKAGE";
sudo mkdir --parent $CNI_INSTALLATION_DIRECTORY;
sudo tar Cxzvf $CNI_INSTALLATION_DIRECTORY $CNI_PLUGINS_PACKAGE;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';

INSTALLED_MODULE_NAME="nerdctl";
echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

NERDCTL_VERSION=0.23.0;
NERDCTL_PACKAGE="nerdctl-$NERDCTL_VERSION-linux-amd64.tar.gz";
curl -LO https://github.com/containerd/nerdctl/releases/download/v$NERDCTL_VERSION/$NERDCTL_PACKAGE;
sudo tar Cxzvvf /usr/local/bin $NERDCTL_PACKAGE;
sudo nerdctl run hello-world;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';
