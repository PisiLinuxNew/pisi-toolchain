#!/bin/bash
# 5.34. Xz-5.2.5
set -e
cd $LFS/sources
rm -rf xz-5.4.4
tar xf xz-5.4.4.tar.xz
cd xz-5.4.4

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf xz-5.4.4
