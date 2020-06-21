#!/bin/bash
# Steps to install and setup zsh.

cat << EOF
########  ######  ##     ##
     ##  ##    ## ##     ##
    ##   ##       ##     ##
   ##     ######  #########
  ##           ## ##     ##
 ##      ##    ## ##     ##
########  ######  ##     ##
EOF

sudo apt update
sudo apt install zsh

# install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
