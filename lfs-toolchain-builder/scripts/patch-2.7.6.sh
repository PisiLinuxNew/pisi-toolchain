#!/bin/bash
# 5.28. Patch-2.7.6
set -e
cd $LFS/sources
rm -rf patch-2.7.6
tar xf patch-2.7.6.tar.xz
cd patch-2.7.6

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf patch-2.7.6
