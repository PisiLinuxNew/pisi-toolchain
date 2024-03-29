#!/bin/bash
# 5.31. Tar-1.33
set -e
cd $LFS/sources
rm -rf tar-1.35
tar xf tar-1.35.tar.xz
cd tar-1.35

export FORCE_UNSAFE_CONFIGURE=1

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf tar-1.35
