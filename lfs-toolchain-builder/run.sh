#!/bin/bash

set -e
export LFS=/mnt/lfs
LFS=/mnt/lfs
if [[ ! -d $LFS/sources ]]; then
  echo
  echo "********************************"
  echo "* Fetching sources and patches *"
  echo "********************************"
  echo
  mkdir -v $LFS/sources
  chmod -v a+wt $LFS/sources
  echo "Downloading source files. This might take a while depending on your internet connection speed"
  cat /scripts/wget-list | xargs -n 1 -P 20 wget --continue --directory-prefix=$LFS/sources > /dev/null 2>&1

  # Verify we have all of the source files.
  shopt -s nullglob
  files=($LFS/sources/*)
  if (( "${#files[@]}" != 87 )); then
    echo "ARRGGHH! I see ${#files[@]} in $LFS/sources when I should see 87. Bailing out here!"
    exit
  fi

  shopt -u nullglob
  pushd $LFS/sources
  md5sum -c /scripts/md5sums
  popd
fi

# Prepare environment
if [[ ! -d $LFS/tools ]]; then
  mkdir -v $LFS/tools
fi
ln -sv $LFS/tools /

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

source ~/.bashrc
export MAKEFLAGS='-j'

# Check host requirements are met.
# http://www.linuxfromscratch.org/lfs/view/stable/prologue/hostreqs.html
sh /scripts/m4-1.4.19.sh > /mnt/lfs/sources/logs/m4-1.4.19 2>&1

if [[ ! -d /mnt/lfs/sources/logs ]]; then
  mkdir /mnt/lfs/sources/logs
fi

echo
echo "************************************"
echo "* Now, for building daz toolchain! *"
echo "************************************"
echo
# 5.4. binutils
echo "Building: 5.4. Binutils - Pass 1 - Pass 1 (30 packages left)"
sh /scripts/binutils-2.41.sh > /mnt/lfs/sources/logs/binutils-2.41 2>&1
# 5.5. coreutils
echo "Building: 5.5. Coreutils - Pass 1 (29 packages left)"
sh /scripts/coreutils-9.3.sh > /mnt/lfs/sources/logs/coreutils-9.3 2>&1
# 5.6. except
echo "Building: 5.6. Expect  (28 packages left)"
sh /scripts/expect5.45.4.sh > /mnt/lfs/sources/logs/expect5.45.4 2>&1
# 5.7. gawk
echo "Building: 5.7. Gawk (27 packages left)"
sh /scripts/gawk-5.2.2.sh > /mnt/lfs/sources/logs/gawk-5.2.2 2>&1
# 5.8. libstdc++ from gcc
# echo "Building: 5.8. Libstdc++ from GCC (26 packages left)"
# sh /scripts/libstdc++-8.2.0.sh > /mnt/lfs/sources/logs/libstdc++-8.2.0 2>&1
# 5.9. gzip
echo "Building: 5.9. Gzip (25 packages left)"
sh /scripts/gzip-1.12.sh > /mnt/lfs/sources/logs/gzip-1.12 2>&1
# 5.10. m4
echo "Building: 5.10. M4 - Pass 2 (24 packages left)"
sh /scripts/m4-1.4.19.sh > /mnt/lfs/sources/logs/m4-1.4.19 2>&1
# 5.11. package
#echo "Building: 5.11. Tcl (23 packages left)"
#sh /scripts/tcl8.6.8.sh > /mnt/lfs/sources/logs/tcl8.6.8 2>&1
# 5.12. package
#echo "Building: 5.12. Expect (22 packages left)"
#sh /scripts/expect5.45.4.sh > /mnt/lfs/sources/logs/expect5.45.4 2>&1
# 5.13. package
#echo "Building: 5.13. DejaGNU (21 packages left)"
#sh /scripts/dejagnu-1.6.1.sh > /mnt/lfs/sources/logs/dejagnu-1.6.1 2>&1
# 5.14. Binutils - Pass2
echo "Building: 5.14. Binutils - Pass2 (20 packages left)"
sh /scripts/binutils-2.41-pass2.sh > /mnt/lfs/sources/logs/binutils-2.41-pass2 2>&1
# 5.15. bzip2
echo "Building: 5.15. Bzip2 (19 packages left)"
sh /scripts/bzip2-1.0.8.sh > /mnt/lfs/sources/logs/bzip2-1.0.8 2>&1
# 5.16. diffutils
echo "Building: 5.16. Diffutils (18 packages left)"
sh /scripts/diffutils-3.10.sh > /mnt/lfs/sources/logs/diffutils-3.10 2>&1
# 5.17. findutils
echo "Building: 5.17. Findutils (17 packages left)"
sh /scripts/findutils-4.9.0.sh > /mnt/lfs/sources/logs/findutils-4.9.0 2>&1
# 5.18. gcc
echo "Building: 5.18. GCC (16 packages left)"
sh /scripts/gcc-13.2.0.sh > /mnt/lfs/sources/logs/gcc-13.2.0 2>&1
# 5.19. grep
echo "Building: 5.19. Grep (15 packages left)"
sh /scripts/grep-3.11.sh > /mnt/lfs/sources/logs/grep-3.11 2>&1
# 5.20. linux
echo "Building: 5.20. Linux (14 packages left)"
sh /scripts/linux-6.4.12.sh > /mnt/lfs/sources/logs/linux-6.4.12 2>&1
# 5.21. ncurses
echo "Building: 5.21. Ncurses (13 packages left)"
sh /scripts/ncurses-6.4.sh > /mnt/lfs/sources/logs/ncurses-6.4 2>&1
# 5.22. sed
echo "Building: 5.22. Sed (12 packages left)"
sh /scripts/sed-4.9.sh > /mnt/lfs/sources/logs/sed-4.9 2>&1
# 5.23. textinfo
echo "Building: 5.23. Textinfo (11 packages left)"
sh /scripts/texinfo-7.0.3.sh > /mnt/lfs/sources/logs/texinfo-7.0.3 2>&1
# 5.24. bash
echo "Building: 5.24. Bash (10 packages left)"
sh /scripts/bash-5.2.15.sh > /mnt/lfs/sources/logs/bash-5.2.15 2>&1
# 5.25. bison
echo "Building: 5.25. Bison (9 packages left)"
sh /scripts/bison-3.8.2.sh > /mnt/lfs/sources/logs/bison-3.8.2 2>&1
# 5.26. dejagnu
echo "Building: 5.26. DejaGNU (8 packages left)"
sh /scripts/dejagnu-1.6.3.sh > /mnt/lfs/sources/logs/dejagnu-1.6.3 2>&1
# 5.27. file
echo "Building: 5.27. File (7 packages left)"
sh /scripts/file-5.45.sh > /mnt/lfs/sources/logs/file-5.45 2>&1
# 5.28. gcc - Pass2
echo "Building: 5.28. GCC - Pass2 (6 packages left)"
sh /scripts/gcc-13.2.0-pass2.sh > /mnt/lfs/sources/logs/gcc-13.2.0-pass2 2>&1
# 5.29. glibc
echo "Building: 5.29. Glibc (5 packages left)"
sh /scripts/glibc-2.38.sh > /mnt/lfs/sources/logs/glibc-2.38 2>&1
# 5.30. libstdc++
echo "Building: 5.30. Libstdc++ (4 packages left)"
sh /scripts/libstdc++13.2.0.sh > /mnt/lfs/sources/logs/libstdc++13.2.0 2>&1
# 5.31. make
echo "Building: 5.31. Make (3 packages left)"
sh /scripts/make-4.4.1.sh > /mnt/lfs/sources/logs/make-4.4.1 2>&1
# 5.32. perl
echo "Building: 5.32. Perl (2 packages left)"
sh /scripts/perl-5.38.0.sh > /mnt/lfs/sources/logs/perl-5.38.0 2>&1
# 5.33. tcl
echo "Building: 5.33. Tcl (1 package left)"
sh /scripts/tcl8.6.13.sh > /mnt/lfs/sources/logs/tcl8.6.13 2>&1
# 5.34. xz
echo "Building: 5.34. Xz (last package)"
sh /scripts/xz-5.4.4.sh > /mnt/lfs/sources/logs/xz-5.4.4 2>&1

echo
echo "**************************************"
echo "* Stripping                          *"
echo "* (But you can leave your hat on!)   *"
echo "* It is safe to ignore any warnings. *"
echo "**************************************"
echo
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
rm -rf /tools/{,share}/{info,man,doc}
find /tools/{lib,libexec} -name \*.la -delete

chown -R root:root $LFS/tools

echo
echo "****************************************************"
echo "* Tool chain has now been build.                   *"
echo "* You can now build the base Linux                 *"
echo "* From Scratch base syste.                         *"
echo "* Visit https://github.com/TLyngeJ/lfs-base-system *"
echo "* for more info.                                   *"
echo "****************************************************"
echo
sh ../run.sh