#!/bin/bash
# 5.21. File-5.39
set -e
cd $LFS/sources
rm -rf file-5.45
tar xf file-5.45.tar.gz
cd file-5.45

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf file-5.45
