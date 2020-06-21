#!/bin/bash

echo "----- APT INSTALL ----- "
sudo apt update
sudo apt install $(cat deps/ubuntu/requiremets.apt)

echo "----- INSTALL FROM SOURCE ----- "
./deps/ubuntu/vim/install.sh
./deps/ubuntu/vifm/install.sh
./deps/ubuntu/zsh/install.sh
./deps/ubuntu/tmux/install.sh
