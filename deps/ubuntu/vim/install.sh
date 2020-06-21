#!/bin/bash
# Steps to build and install vifm from source on Ubuntu.

cat << EOF
##     ## #### ##     ##
##     ##  ##  ###   ###
##     ##  ##  #### ####
##     ##  ##  ## ### ##
 ##   ##   ##  ##     ##
  ## ##    ##  ##     ##
   ###    #### ##     ##

EOF

VERSION=8.2

sudo apt -y remove vim
sudo apt -y remove vim-gtk
sudo apt -y remove vim-gnome
sudo apt -y remove vim-athena

sudo apt install libncurses5-dev  libcairo2-dev || exit $?

git clone https://github.com/vim/vim.git vim-${VERSION}
cd vim-${VERSION} || exit $?

./configure \
	--enable-cscope \
	--with-features=huge \
	--enable-python3interp=yes \
	--with-python3-command=/usr/bin/python3

make
sudo make install
cd ../ && rm -rf vim-${VERSION}

sudo update-alternatives --install "/usr/bin/vim" "vim" "/usr/local/bin/vim" 1
## Logout and login to the shell again and run.
## vifm --version
