#!/bin/bash
# Steps to build and install vifm from source on Ubuntu.

VERSION=0.10.1

sudo apt -y remove vifm
sudo apt install wget tar build-essential libncursesw5-dev || exit $?

wget -c "https://netix.dl.sourceforge.net/project/vifm/vifm/vifm-${VERSION}.tar.bz2" || exit $?
tar xf vifm-${VERSION}.tar.bz2 || exit $?
rm -f vifm-${VERSION}.tar.bz2
cd vifm-${VERSION} || exit $?

./configure && make && sudo make install || exit $?

cd ../ && rm -rf vifm-${VERSION}
## Logout and login to the shell again and run.
## vifm --version
