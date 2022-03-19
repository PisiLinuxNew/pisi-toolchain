#!/bin/bash
# 5.23. Gawk-5.1.0
set -e
cd $LFS/sources
rm -rf gawk-5.1.0
tar xf gawk-5.1.0.tar.xz
cd gawk-5.1.0

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gawk-5.1.0
