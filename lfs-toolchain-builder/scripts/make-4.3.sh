#!/bin/bash
# 5.27. Make-4.3
set -e
cd $LFS/sources
rm -rf make-4.3
tar xf make-4.3.tar.bz2
cd make-4.3

sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
./configure --prefix=/tools --without-guile
make
make install

cd $LFS/sources
rm -rf make-4.3
