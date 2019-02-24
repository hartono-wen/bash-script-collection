#!/bin/bash

sudo add-apt-repository ppa:shevchuk/dnscrypt-proxy -y;
sudo apt update;
sudo apt install -y dnscrypt-proxy;

sudo sed -i 's@dns=dnsmasq@#dns=dnsmasq@g' /etc/NetworkManager/NetworkManager.conf;

sudo cp /etc/dnscrypt-proxy/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml.original;

sudo sed -i 's@listen_addresses = \[\]@listen_addresses = \['\''127.0.0.1:53'\''\]@g' /etc/dnscrypt-proxy/dnscrypt-proxy.toml;

sudo sed -i 's@nameserver 127.0.1.1@nameserver 127.0.0.1@g' /etc/resolv.conf;

sudo service network-manager restart;
sudo service dnscrypt-proxy restart;
