#!/bin/bash
# 5.32. Texinfo-6.7
set -e
cd $LFS/sources
rm -rf texinfo-7.0.3
tar xf texinfo-7.0.3.tar.xz
cd texinfo-7.0.3

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf texinfo-7.0.3
