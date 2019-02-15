#!/bin/bash

INSTALLED_MODULE_NAME="Erlang and Elixir";

echo '===Start installing '$INSTALLED_MODULE_NAME'=============';

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install the needed application=============';
sudo apt-get install -y wget;

echo '===Download '$INSTALLED_MODULE_NAME$'\'s package installer=============';
sudo wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb;

echo '===Install '$INSTALLED_MODULE_NAME' package using dpkg=============';
sudo dpkg -i erlang-solutions_1.0_all.deb;

echo '===Update the apt package index=============';
sudo apt-get update;

echo '===Install '$INSTALLED_MODULE_NAME'=============';
sudo apt-get install -y esl-erlang elixir;

echo '===Remove unneeded artifacts=============';
sudo rm erlang-solutions_1.0_all.deb;

echo '===Finish instaling '$INSTALLED_MODULE_NAME'=============';
elixir --version;
