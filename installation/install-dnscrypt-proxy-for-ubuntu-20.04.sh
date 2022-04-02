#!/bin/bash

sudo apt-get install -y dnscrypt-proxy resolvconf;
sudo cp /etc/dnscrypt-proxy/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml.original
NAMESERVER_IP_ADDRESS='127.0.2.1';
echo 'nameserver '${NAMESERVER_IP_ADDRESS} | sudo tee /etc/resolv.conf.override;
echo '#!/bin/sh' | sudo tee /etc/NetworkManager/dispatcher.d/20-resolv-conf-override;
echo 'cp -f /etc/resolv.conf.override /run/resolvconf/resolv.conf;' | sudo tee -a /etc/NetworkManager/dispatcher.d/20-resolv-conf-override;
sudo chmod +x /etc/NetworkManager/dispatcher.d/20-resolv-conf-override;
sudo ln -f /etc/NetworkManager/dispatcher.d/20-resolv-conf-override /etc/NetworkManager/dispatcher.d/pre-up.d;
sudo systemctl restart NetworkManager;
sudo systemctl restart dnscrypt-proxy;




