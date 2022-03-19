#!/bin/bash
# 5.26. Gzip-1.10
set -e
cd $LFS/sources
rm -rf gzip-1.10
tar xf gzip-1.10.tar.xz
cd gzip-1.10

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
./configure --prefix=/tools
make
make install

cd $LFS/sources
rm -rf gzip-1.10
