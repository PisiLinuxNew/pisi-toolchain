#!/bin/bash
# 5.25. Grep-3.6
set -e
cd $LFS/sources
rm -rf grep-3.6
tar xf grep-3.6.tar.xz
cd grep-3.6

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf grep-3.6
