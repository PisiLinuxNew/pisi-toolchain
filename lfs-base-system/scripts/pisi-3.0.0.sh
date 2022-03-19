#!/bin/bash
# pisi-3.0.0
set -e
cd $LFS/sources
rm -rf pisi-3.0.0
tar xf pisi-3.0.a1.tar.xz
cd pisi-3.0.0

python bootstrap.py
python setup.py build
python setup.py install --optimize=1

cd $LFS/sources
rm -rf pisi-3.0.0
