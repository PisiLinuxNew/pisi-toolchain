#!/bin/bash
# 5.30. Sed-4.8
set -e
cd $LFS/sources
rm -rf sed-4.8
tar xf sed-4.8.tar.xz
cd sed-4.8

./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf sed-4.8
