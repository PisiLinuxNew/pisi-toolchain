#!/bin/bash
# setuptools-50.3.2
set -e
cd $LFS/sources
rm -rf setuptools-50.3.2
tar xf setuptools-50.3.2.tar.xz
cd setuptools-50.3.2

python bootstrap.py
python setup.py build
python setup.py install --optimize=1

cd $LFS/sources
rm -rf setuptools-50.3.2
