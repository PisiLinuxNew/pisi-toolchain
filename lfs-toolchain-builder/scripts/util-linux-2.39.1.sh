#!/bin/bash
# 5.33. Util-linux-2.36.1
set -e
cd $LFS/sources
rm -rf util-linux-2.39.1
tar xf util-linux-2.39.1.tar.xz
cd util-linux-2.39.1

./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            --without-ncurses              \
            PKG_CONFIG=""
make
make install

cd $LFS/sources
rm -rf util-linux-2.39.1
