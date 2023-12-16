#!/bin/bash
# 5.29. Perl-5.32.0
set -e
cd $LFS/sources
rm -rf perl-5.38.0
tar xf perl-5.38.0.tar.xz
cd perl-5.38.0

sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth
make
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.32.0
cp -Rv lib/* /tools/lib/perl5/5.32.0

cd $LFS/sources
rm -rf perl-5.38.0
