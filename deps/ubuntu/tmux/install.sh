#!/bin/bash
# Steps to build and install tmux from source on Ubuntu.
# https://gist.github.com/indrayam/ebf53ba970241694865e1dd2b1313945

cat << EOF
######## ##     ## ##     ## ##     ##
   ##    ###   ### ##     ##  ##   ##
   ##    #### #### ##     ##   ## ##
   ##    ## ### ## ##     ##    ###
   ##    ##     ## ##     ##   ## ##
   ##    ##     ## ##     ##  ##   ##
   ##    ##     ##  #######  ##     ##
EOF

VERSION=2.5
sudo apt -y remove tmux
sudo apt -y install wget tar libevent-dev libncurses-dev

wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}

./configure
make
sudo make install

cd ../ && rm -rf tmux-${VERSION}

# ????
# cd -
# sudo rm -rf /usr/local/src/tmux-*
# sudo mv tmux-${VERSION} /usr/local/src

## Logout and login to the shell again and run.
## tmux -V
