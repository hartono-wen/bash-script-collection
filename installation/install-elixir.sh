#!/bin/bash

sudo wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb;
sudo dpkg -i erlang-solutions_1.0_all.deb;

sudo apt-get update;

sudo apt-get install -y esl-erlang elixir;

sudo rm erlang-solutions_1.0_all.deb;
