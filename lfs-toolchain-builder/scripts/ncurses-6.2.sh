#!/bin/bash
# 5.15. Ncurses-6.2
set -e
cd $LFS/sources
rm -rf ncurses-6.2
tar xf ncurses-6.2.tar.gz
cd ncurses-6.1

sed -i s/mawk// configure
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite
make
make install

cd $LFS/sources
rm -rf ncurses-6.2
