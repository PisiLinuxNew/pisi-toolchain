#!/bin/bash
# 5.25. Grep-3.6
set -e
cd $LFS/sources
rm -rf grep-3.11
tar xf grep-3.11.tar.xz
cd grep-3.11

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf grep-3.11
