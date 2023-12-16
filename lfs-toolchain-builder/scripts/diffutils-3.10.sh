#!/bin/bash
# 5.20. Diffutils-3.7
set -e
cd $LFS/sources
rm -rf diffutils-3.10
tar xf diffutils-3.10.tar.xz
cd diffutils-3.10

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf diffutils-3.10
