#!/bin/bash
# 5.24. Gettext-0.21
set -e
cd $LFS/sources
rm -rf gettext-0.21
tar xf gettext-0.21.tar.xz
cd gettext-0.21

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin

cd $LFS/sources
rm -rf gettext-0.21
