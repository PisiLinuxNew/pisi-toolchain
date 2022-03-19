#!/bin/bash
# 5.32. Texinfo-6.7
set -e
cd $LFS/sources
rm -rf texinfo-6.7
tar xf texinfo-6.7.tar.xz
cd texinfo-6.7

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf texinfo-6.7
