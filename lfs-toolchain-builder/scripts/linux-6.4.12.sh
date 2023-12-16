#!/bin/bash
# 5.6. Linux-5.10.7 API Headers
set -e
cd $LFS/sources
rm -rf linux-6.4.12
tar xf linux-6.4.12tar.xz
cd linux-6.4.12

make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

cd $LFS/sources
rm -rf linux-6.4.12
