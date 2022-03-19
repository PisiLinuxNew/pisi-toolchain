#!/bin/bash
# 5.7. Glibc-2.32
set -e
cd $LFS/sources
rm -rf glibc-2.32
tar xf glibc-2.32.tar.xz
cd glibc-2.32

mkdir -v build
cd       build
../configure                             \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2             \
      --with-headers=/tools/include      \
      libc_cv_forced_unwind=yes          \
      libc_cv_c_cleanup=yes
make
make install

cd $LFS/sources
rm -rf glibc-2.32
