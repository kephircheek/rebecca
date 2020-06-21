#!/bin/bash

cat << EOF
##     ## #### ##     ##
##     ##  ##  ###   ###
##     ##  ##  #### ####
##     ##  ##  ## ### ##
 ##   ##   ##  ##     ##
  ## ##    ##  ##     ##
   ###    #### ##     ##

EOF
# vim (gtk/athena with +clipboard)
./deps/ubuntu/install_vim.sh

cat << EOF
##     ## #### ######## ##     ##
##     ##  ##  ##       ###   ###
##     ##  ##  ##       #### ####
##     ##  ##  ######   ## ### ##
 ##   ##   ##  ##       ##     ##
  ## ##    ##  ##       ##     ##
   ###    #### ##       ##     ##
EOF
./deps/ubuntu/install_vifm.sh

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
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat << EOF
######## ##     ## ##     ## ##     ##
   ##    ###   ### ##     ##  ##   ##
   ##    #### #### ##     ##   ## ##
   ##    ## ### ## ##     ##    ###
   ##    ##     ## ##     ##   ## ##
   ##    ##     ## ##     ##  ##   ##
   ##    ##     ##  #######  ##     ##
EOF
./deps/ubuntu/install_tmux.sh

echo "----- OTHER ----- "
sudo apt update
sudo apt install pylint3
sudo apt install flake8
sudo apt install cmake

