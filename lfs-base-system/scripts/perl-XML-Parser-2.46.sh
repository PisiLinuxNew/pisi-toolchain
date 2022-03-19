#!/bin/bash
# perl-XML-Parser-2.46
set -e
cd $LFS/sources
rm -rf perl-XML-Parser-2.46
tar xf perl-XML-Parser-2.46.tar.gz
cd perl-XML-Parser-2.46

echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
export BUILD_ZLIB=False
export BUILD_BZIP2=0
perl Makefile.pl
make
make install
unset BUILD_ZLIB BUILD_BZIP2

cd $LFS/sources
rm -rf perl-XML-Parser-2.46
