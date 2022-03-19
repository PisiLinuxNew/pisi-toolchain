#!/bin/bash
# piksemel.1.3.sh
set -e
cd $LFS/sources
rm -rf piksemel.1.3
tar xf piksemel.1.3.tar.xz
cd piksemel.1.3

python setup.py install --optimize=1

cd $LFS/sources
rm -rf piksemel.1.3
