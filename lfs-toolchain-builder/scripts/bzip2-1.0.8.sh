#!/bin/bash
# 5.18. Bzip2-1.0.8
set -e
cd $LFS/sources
rm -rf bzip2-1.0.8
tar xf bzip2-1.0.8.tar.gz
cd bzip2-1.0.8

make
make PREFIX=/tools install

cd $LFS/sources
rm -rf bzip2-1.0.8
