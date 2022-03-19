#!/bin/bash
# 5.12. Expect-5.45.4
set -e
cd $LFS/sources
rm -rf expect5.45.4
tar xf expect5.45.4.tar.gz
cd expect5.45.4

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure
./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include
make
make install
make SCRIPTS="" install

cd $LFS/sources
rm -rf expect5.45.4
