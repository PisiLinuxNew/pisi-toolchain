#!/bin/bash
# catbox-1.6.1
set -e
cd $LFS/sources
rm -rf catbox-1.6.1
tar xf catbox-1.6.1.tar.xz
cd catbox-1.6.1

python setup.py install --optimize=1

cd $LFS/sources
rm -rf catbox-1.6.1
