#!/bin/bash
# 5.19. Coreutils-8.32
set -e
cd $LFS/sources
rm -rf coreutils-9.3
tar xf coreutils-9.3.tar.xz
cd coreutils-9.3

export FORCE_UNSAFE_CONFIGURE=1
./configure --prefix=/tools --enable-install-program=hostname
make
make install

cd $LFS/sources
rm -rf coreutils-9.3
